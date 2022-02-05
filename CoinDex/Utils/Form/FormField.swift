//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol FormFieldDelegate: AnyObject {

    func fieldDidChangeValue(_ field: FormField)
}

protocol FormField: AnyObject {

    var key: String { get }
    var height: CGFloat { get }
    var delegate: FormFieldDelegate? { get set }

    func register(for tableView: UITableView)
    func dequeue(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

extension FormField {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
