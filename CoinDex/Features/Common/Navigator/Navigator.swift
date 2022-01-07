//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol MDNavigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}
