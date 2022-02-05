//
//  Copyright © 2022 CCT. All rights reserved.
//


import UIKit

protocol FormHeader: AnyObject {

    var key: String { get }
    var height: CGFloat { get }

    func register(for tableView: UITableView)
    func dequeue(for tableView: UITableView, in section: Int) -> UIView?
}

