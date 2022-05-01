//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - DeepLink
/// Adopted by a type whose values are matched and extracted from a URL.
public protocol DeepLink {
    /// Returns a template that describes how to match and extract values from a URL.
    static var template: DeepLinkTemplate { get }
    
    /// Initializes a new instance with values extracted from a URL.
    /// - Parameter values: Data values from a URL, whose keys are the names specified in a `DeepLinkTemplate`.
    init(values: DeepLinkValues)
}
