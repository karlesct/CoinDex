//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

class CountryPickerViewController: UIViewController {

    // MARK: - IBoutlets

    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.delegate = self
            self.searchBar.placeholder = "Search"
        }
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.separatorStyle = .none
            self.tableView.tableFooterView = UIView()

            self.tableView.register(CountryPickerTableViewCell.self)
        }
    }

    // MARK: - Properties

    var viewModel: CountryPickerViewModelProtocol?
    var loggingService: LoggingServiceProtocol?
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.view = self
        self.viewModel?.viewDidLoad()
    }


}

extension CountryPickerViewController: CountryPickerViewProtocol {
    func reloadData() {
        self.tableView.reloadData()
        self.tableView.reloadSectionIndexTitles()
    }
}

extension CountryPickerViewController: UITableViewDelegate {}

extension CountryPickerViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let key = self.viewModel?.sectionTitles[indexPath.section],
           let value = self.viewModel?.dictionary[key] {
            let cell = self.tableView.dequeueReusableCell(CountryPickerTableViewCell.self,
                                                          for: indexPath)
            let item = value[indexPath.row] 
            cell.bind(with: item,
                      delegate: self)
            return cell
        }
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.sectionTitles.count ?? 0
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        if let key = self.viewModel?.sectionTitles[section],
           let value = self.viewModel?.dictionary[key] {
            return value.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel?.sectionTitles[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.viewModel?.sectionTitles
    }
}

extension CountryPickerViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel?.searchTextDidChange(text: searchText)
    }
}

extension CountryPickerViewController: CountryPickerTableViewCellDelegate {
    func cellSelected(item: CountryPickerCellModel?) {
        guard let item = item else { return }
        
        self.loggingService?.log("[CountryPickerViewController] - Cell selected with phone Code: \(item.phoneCode) and CountryName: \(item.countryName)")
        
        self.dismiss(animated: false,
                     completion: nil)
    }
}

