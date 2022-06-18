//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

protocol WillDisappear {
    func willDisappear()
}

protocol DidDisappear {
    func didDisappear()
}

protocol DisappearProtocol: WillDisappear, DidDisappear {}
