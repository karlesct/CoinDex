//
//  Copyright © 2022 CCT. All rights reserved.
//


import Foundation

// MARK: - DeepLinkRecognizer
/// Creates a deep link object that matches a URL.
public struct DeepLinkRecognizer {
    private let deepLinkTypes: [DeepLink.Type]
    
    /// Initializes a new recognizer with a list of available deep link types.
    /// - Parameter deepLinkTypes: An array of deep link types which can be created based on a URL.
    /// The template of each type is evaluated in the order the types appear in this array.
    public init(deepLinkTypes: [DeepLink.Type]) {
        self.deepLinkTypes = deepLinkTypes
    }
    
    /// Returns a new `DeepLink` object whose template matches the specified URL, if possible.
    public func deepLink(matching url: URL) -> DeepLink? {
        for deepLinkType in deepLinkTypes {
            if let values = DeepLinkRecognizer.extractValues(in: deepLinkType.template, from: url) {
                return deepLinkType.init(values: values)
            }
        }
        return nil
    }
    
    // MARK: - URL value extraction
    private static func extractValues(in template: DeepLinkTemplate, from url: URL) -> DeepLinkValues? {
        guard let pathValues = extractPathValues(in: template, from: url) else { return nil }
        guard let queryValues = extractQueryValues(in: template, from: url) else { return nil }
        guard let fragmentValues = extractFragmentValues(in: template, from: url) else { return nil }
        return DeepLinkValues(path: pathValues,
                              query: queryValues,
                              fragment: fragmentValues)
    }
    
    private static func extractPathValues(in template: DeepLinkTemplate, from url: URL) -> [String: Any]? {
        let allComponents = url.host.map { [$0] + url.pathComponents} ?? url.pathComponents
        let components = allComponents
            .filter { $0 != "/" }
            .map    { $0.removingPercentEncoding ?? "" }
        guard components.count == template.pathParts.count else { return nil }
        var values = [String: Any]()
        for (pathPart, component) in zip(template.pathParts, components) {
            switch pathPart {
            case let .int(name):
                guard let value = Int(component) else { return nil }
                values[name] = value
                
            case let .bool(name):
                guard let value = Bool(component) else { return nil }
                values[name] = value
                
            case let .double(name):
                guard let value = Double(component) else { return nil }
                values[name] = value
                
            case let .string(name):
                values[name] = component
                
            case let .term(symbol):
                guard symbol == component else { return nil }
            }
        }
        return values
    }
    
    private static func extractQueryValues(in template: DeepLinkTemplate, from url: URL) -> [String: Any]? {
        guard let parameters = template.parameters else {
            return url.query == nil ? [:] : nil
        }
        
        let requiredParameters = parameters.filter { $0.isRequired }
        let optionalParameters = parameters.subtracting(requiredParameters)
        
        guard let query = url.query else {
            return requiredParameters.isEmpty ? [:] : nil
        }
        
        let queryMap = createMap(of: query)
        var values = [String: Any]()
        
        for parameter in requiredParameters {
            guard let value = value(of: parameter, in: queryMap) else { return nil }
            values[parameter.name] = value
        }
        
        for parameter in optionalParameters {
            if let value = value(of: parameter, in: queryMap) {
                values[parameter.name] = value
            }
        }
        
        return values
    }
    
    private static func extractFragmentValues(in template: DeepLinkTemplate, from url: URL) -> [String: Any]? {
        guard let fragments = template.fragments else {
            return url.fragment == nil ? [:] : nil
        }
        
        let requiredParameters = fragments.filter { $0.isRequired }
        let optionalParameters = fragments.subtracting(requiredParameters)
        
        guard let fragment = url.fragment else {
            return requiredParameters.isEmpty ? [:] : nil
        }
        
        let fragmentMap = createMap(of: fragment)
        var values = [String: Any]()
        
        for parameter in requiredParameters {
            guard let value = value(of: parameter, in: fragmentMap) else { return nil }
            values[parameter.name] = value
        }
        
        for parameter in optionalParameters {
            if let value = value(of: parameter, in: fragmentMap) {
                values[parameter.name] = value
            }
        }
        
        return values
    }
    
    private typealias QueryMap = [String: String]
    private static func createMap(of query: String) -> QueryMap {
        // Transforms "a=b&c=d" to [(a, b), (c, d)]
        let keyValuePairs = query
            .components(separatedBy: "&")
            .map    { $0.components(separatedBy: "=") }
            .filter { $0.count == 2 }
            .map    { ($0[0], $0[1]) }
        
        var queryMap = QueryMap()
        for (key, value) in keyValuePairs {
            queryMap[key] = value
        }
        return queryMap
    }
    
    private static func value(of parameter: DeepLinkTemplate.QueryStringParameter, in queryMap: QueryMap) -> Any? {
        guard let value: String = queryMap[parameter.name] else { return nil }
        switch parameter.type {
        case .int:    return Int(value)
        case .bool:   return Bool(value)
        case .double: return Double(value)
        case .string: return value.removingPercentEncoding ?? ""
        }
    }
}

// MARK: - QueryStringParameter extension
extension DeepLinkTemplate.QueryStringParameter: Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func ==(lhs: DeepLinkTemplate.QueryStringParameter, rhs: DeepLinkTemplate.QueryStringParameter) -> Bool {
        return lhs.name == rhs.name
    }
    
    fileprivate var name: String {
        switch self {
        case let .requiredInt(name):    return name
        case let .requiredBool(name):   return name
        case let .requiredDouble(name): return name
        case let .requiredString(name): return name
        case let .optionalInt(name):    return name
        case let .optionalBool(name):   return name
        case let .optionalDouble(name): return name
        case let .optionalString(name): return name
        }
    }
    
    fileprivate enum ParameterType { case string, int, double, bool }
    fileprivate var type: ParameterType {
        switch self {
        case .requiredInt,    .optionalInt:    return .int
        case .requiredBool,   .optionalBool:   return .bool
        case .requiredDouble, .optionalDouble: return .double
        case .requiredString, .optionalString: return .string
        }
    }
    
    fileprivate var isRequired: Bool {
        switch self {
        case .requiredInt, .requiredBool, .requiredDouble, .requiredString: return true
        case .optionalInt, .optionalBool, .optionalDouble, .optionalString: return false
        }
    }
}
