//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - DeepLinkValues
/// Data values extracted from a URL by a deep link template.
public struct DeepLinkValues {
    /// Values in the URL's path, whose keys are the names specified in a deep link template.
    public let path: [String: Any]
    
    /// Values in the URL's query string, whose keys are the names specified in a deep link template.
    public let query: [String: Any]
    
    /// The URL's fragment (i.e. text following a # symbol), if available.
    public let fragment: [String: Any]
    
    public init(path: [String: Any],
                query: [String: Any],
                fragment: [String: Any]) {
        self.path = path
        self.query = query
        self.fragment = fragment
    }
}
