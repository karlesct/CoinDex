//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol DatasourceProtocol {
    var dataSource: [TModel]? { get }
    var dataSourcePublished: Published<[TModel]?> { get }
    var dataSourcePublisher: Published<[TModel]?>.Publisher { get }
}
