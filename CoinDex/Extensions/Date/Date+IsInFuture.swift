//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

public extension Date {
    
    var isInFuture: Bool {
        return self > Date()
    }
}
