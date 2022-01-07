//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol Navigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}
