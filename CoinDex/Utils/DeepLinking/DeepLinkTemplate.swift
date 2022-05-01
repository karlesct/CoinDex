//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - DeepLinkTemplate
/// Describes how to extract a deep link's values from a URL.
/// A template is considered to match a URL if all of its required values are found in the URL.
public struct DeepLinkTemplate {
    // MARK: - Public API
    public init() {
        self.init(pathParts: [],
                  parameters: [],
                  fragments: [])
    }
    
    /// A matching URL must include this constant string at the correct location in its path.
    public func term(_ symbol: String) -> DeepLinkTemplate {
        return appending(pathPart: .term(symbol: symbol))
    }
    
    /// A matching URL must include a string at the correct location in its path.
    /// - Parameter name: The key of this string in the `path` dictionary of `DeepLinkValues`.
    public func string(named name: String) -> DeepLinkTemplate {
        return appending(pathPart: .string(name: name))
    }
    
    /// A matching URL must include an integer at the correct location in its path.
    /// - Parameter name: The key of this integer in the `path` dictionary of `DeepLinkValues`.
    public func int(named name: String) -> DeepLinkTemplate {
        return appending(pathPart: .int(name: name))
    }
    
    /// A matching URL must include a double at the correct location in its path.
    /// - Parameter name: The key of this double in the `path` dictionary of `DeepLinkValues`.
    public func double(named name: String) -> DeepLinkTemplate {
        return appending(pathPart: .double(name: name))
    }
    
    /// A matching URL must include a boolean at the correct location in its path.
    /// - Parameter name: The key of this boolean in the `path` dictionary of `DeepLinkValues`.
    public func bool(named name: String) -> DeepLinkTemplate {
        return appending(pathPart: .bool(name: name))
    }
    
    /// An unordered set of query string parameters.
    /// - Parameter queryStringParameters: A set of parameters that may be required or optional.
    public func queryStringParameters(_ queryStringParameters: Set<QueryStringParameter>) -> DeepLinkTemplate {
        return DeepLinkTemplate(pathParts: pathParts, parameters: queryStringParameters, fragments: fragments)
    }
    
    /// An unordered set of fragment string parameters.
    /// - Parameter fragmentStringParameters: A set of parameters that may be required or optional.
    public func fragmentStringParameters(_ fragmentStringParameters: Set<QueryStringParameter>) -> DeepLinkTemplate {
        return DeepLinkTemplate(pathParts: pathParts, parameters: parameters, fragments: fragmentStringParameters)
    }
    
    /// A named value in a URL's query string.
    public enum QueryStringParameter {
        case requiredInt(named: String),
             optionalInt(named: String)
        case requiredBool(named: String),
             optionalBool(named: String)
        case requiredDouble(named: String),
             optionalDouble(named: String)
        case requiredString(named: String),
             optionalString(named: String)
    }
    
    // MARK: - Private creation methods
    private init(pathParts: [PathPart],
                 parameters: Set<QueryStringParameter>? = nil,
                 fragments: Set<QueryStringParameter>? = nil) {
        self.pathParts = pathParts
        self.parameters = parameters
        self.fragments = fragments
    }
    
    private func appending(pathPart: PathPart) -> DeepLinkTemplate {
        return DeepLinkTemplate(pathParts: pathParts + [pathPart],
                                parameters: parameters,
                                fragments: fragments)
    }
    
    // MARK: - State
    enum PathPart {
        case int(name: String)
        case bool(name: String)
        case string(name: String)
        case double(name: String)
        case term(symbol: String)
    }
    let pathParts: [PathPart]
    let parameters: Set<QueryStringParameter>?
    let fragments: Set<QueryStringParameter>?
}
