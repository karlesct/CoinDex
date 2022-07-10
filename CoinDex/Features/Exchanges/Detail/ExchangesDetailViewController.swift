//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import Combine

class ExchangesDetailViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.separatorStyle = .none
            self.tableView.tableFooterView = UIView()
            self.tableView.backgroundColor = .x00FFFFFF
            
            self.tableView.register(ExchangesDetailTrustTableViewCell.self)
            self.tableView.register(ExchangesDetailInfoTableViewCell.self)
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.style = .large
            self.activityIndicator.color = .primary
        }
    }
    
    
    // MARK: - Properties
    
    var viewModel: ExchangesDetailViewModelProtocol?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        
        self.title = self.viewModel?.title
        self.view.backgroundColor = .xF6F6F6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel?.doRequest()
        
    }
    
    // MARK: - Methods
    
    func setupBindings() {
        self.viewModel?.isLoadingPublisher
            .assign(to: \.isLoading,
                    on: self)
            .store(in: &subscriptions)
        
        self.viewModel?.dataSourcePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .store(in: &subscriptions)
    }
    
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.isLoading
                ? self.activityIndicator.startAnimating()
                : self.activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc func doRetry() {
        self.viewModel?.doRequest()
    }
    
}

extension ExchangesDetailViewController: UITableViewDelegate {}

extension ExchangesDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = self.viewModel?.dataSource?[indexPath.row] as? ExchangesDetailInfoCellModel {
            let cell = self.tableView.dequeueReusableCell(ExchangesDetailInfoTableViewCell.self,
                                                          for: indexPath)
            cell.bind(item: item)
            return cell
        } else if let item = self.viewModel?.dataSource?[indexPath.row] as? ExchangesDetailTrustCellModel {
            let cell = self.tableView.dequeueReusableCell(ExchangesDetailTrustTableViewCell.self,
                                                          for: indexPath)
            cell.bind(item: item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let rows = self.viewModel?.dataSource?.count ?? 0
        
        if rows == 0 && !self.activityIndicator.isAnimating {
            let action = UIButton.ButtonAction(target: self,
                                               selector: #selector(self.doRetry),
                                               controlEvent: .touchUpInside)
            tableView.setEmptyView(body: "generic_error".localized,
                                   btTitle: "literal_retry".localized,
                                   btAction: action)
        } else {
            tableView.restore()
        }
        
        return rows
    }
}
