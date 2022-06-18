//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol WillAppearProtocol {
    func willAppear()
}

protocol DidAppearProtocol {
    func didAppear()
}

protocol AppearProtocol: WillAppearProtocol, DidAppearProtocol {}
