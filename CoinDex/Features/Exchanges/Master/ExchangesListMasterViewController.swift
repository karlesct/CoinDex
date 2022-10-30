//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit
import Combine

class ExchangesListMasterViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.prefetchDataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.separatorStyle = .none
            self.tableView.tableFooterView = UIView()
            self.tableView.backgroundColor = .x00FFFFFF
            
            self.tableView.register(ExchangesListMasterTableViewCell.self)
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
    
    var viewModel: ExchangesListMasterViewModelProtocol?
    var navigator: ExchangesListMasterNavigator?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBindings()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let page = self.viewModel?.page ?? 0
        self.viewModel?.doRequest(page: page)
        
    }
    
    // MARK: - Methods
    
    func setupUI() {
        self.setNavigation(image: .tabBar.exchangesIcon,
                           title: self.viewModel?.title ?? .empty,
                           color: .xFFFFFF)
        
        self.view.backgroundColor = .xF6F6F6
    }
    
    func setupBindings() {
        self.viewModel?.isLoadingPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                value
                ? self?.activityIndicator.startAnimating()
                : self?.activityIndicator.stopAnimating()
            })
            .store(in: &subscriptions)
        
        self.viewModel?.dataSourcePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .store(in: &subscriptions)
    }
}

extension ExchangesListMasterViewController: UITableViewDelegate {}

extension ExchangesListMasterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = self.viewModel?.dataSource?[indexPath.row] as? ExchangesListMasterCellModel {
            let cell = self.tableView.dequeueReusableCell(ExchangesListMasterTableViewCell.self,
                                                          for: indexPath)
            cell.bind(item: item,
                      delegate: self)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.dataSource?.count ?? 0
    }
}

extension ExchangesListMasterViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView,
                   prefetchRowsAt indexPaths: [IndexPath]) {
        let sourceTotal = self.viewModel?.dataSource?.count ?? 0
        let page = self.viewModel?.page ?? 0
        let filtered = indexPaths.filter({ $0.row >= sourceTotal - 25})
        if filtered.count > 0 && page < 6 {
            self.viewModel?.page += 1
        }
    }
}


extension ExchangesListMasterViewController: ExchangesListMasterTableViewCellDelegate {
    func selectedCell(id: String?) {
        guard let id = id else { return }
        
        self.navigator?.navigate(to: .detail(id: id))
    }
}
