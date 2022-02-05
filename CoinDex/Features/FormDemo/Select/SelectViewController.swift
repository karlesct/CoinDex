//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol SelectViewInput: AnyObject {

    func configure()
    func setTitle(_ title: String?)
    func reloadTableView()
}

protocol SelectViewOutput: AnyObject {

    var list: [String] { get }

    func viewDidLoad()
    func didSelectItem(at index: Int)
}

final class SelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var output: SelectViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - Configure
extension SelectViewController {

    private func setUpViews() {
        tableView.backgroundColor = .systemGroupedBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell.default")
    }
}

// MARK: - SelectViewInput
extension SelectViewController: SelectViewInput {

    func configure() {
        setUpViews()
    }

    func setTitle(_ title: String?) {
        navigationItem.title = title
    }

    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SelectViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.list.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell.default")
        cell.textLabel?.text = output?.list[indexPath.row] ?? ""
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.output?.didSelectItem(at: indexPath.row)
        }
        navigationController?.popViewController(animated: true)
        CATransaction.commit()
    }
}
