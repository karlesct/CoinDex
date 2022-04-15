//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class FuelHomeViewController: UIViewController {

    // MARK: - IBoutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.style = .large
            self.activityIndicator.color = .primary
        }
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.tableFooterView = UIView()
            self.tableView.separatorStyle = .none

            //self.tableView.register()
        }
    }

    // MARK: - Constants

    // MARK: - Properties

    var viewModel: FuelHomeViewModelProtocol?
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.view = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.viewModel?.viewWillAppear()
    }


    // MARK: - Methods

}

extension FuelHomeViewController: UITableViewDelegate {}

extension FuelHomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let item = self.viewModel?.dataSource?[indexPath.row] as? Message,
//           item.kind == .text {
//            let cell = self.tableView.dequeueReusableCell(TextBubbleTableViewCell.self,
//                                                          for: indexPath)
//            return cell
//        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return self.viewModel?.dataSource?.count ?? 0
    }
}

extension FuelHomeViewController: FuelHomeViewProtocol {
    func setLoading(loading: Bool) {
        DispatchQueue.main.async {
            loading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
    }
}

