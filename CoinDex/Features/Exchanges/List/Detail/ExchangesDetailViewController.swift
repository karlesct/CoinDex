//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class ExchangesDetailViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.tableFooterView = UIView()
            
            self.tableView.register(ExchangesListMasterTableViewCell.self)
        }
    }
    
    // MARK: - Properties
    
    var viewModel: ExchangesDetailViewModelProtocol?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.view = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel?.viewWillAppear()
        
    }
    
    // MARK: - Methods
    
}

extension ExchangesDetailViewController: UITableViewDelegate {}

extension ExchangesDetailViewController: UITableViewDataSource {
    
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

extension ExchangesDetailViewController: ExchangesListMasterTableViewCellDelegate {
    func selectedCell(id: String?) {
        
    }
}

extension ExchangesDetailViewController: ExchangesDetailViewProtocol {
    func setLoading(isLoading: Bool) {
        
    }
    
    func needsReaload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
