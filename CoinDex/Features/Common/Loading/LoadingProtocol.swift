//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation
import Combine

protocol LoadingProtocol {
    var isLoading: Bool { get }
    var isLoadingPublished: Published<Bool> { get }
    var isLoadingPublisher: Published<Bool>.Publisher { get }
}

