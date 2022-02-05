//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol InputDataSource: AnyObject {

    associatedtype Item

    var dataSource: [Item] { get set }
}
