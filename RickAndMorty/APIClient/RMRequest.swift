//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Nana Kojo Ewusie on 07/01/2023.
//

import Foundation

/// Object that represents an API call
final class RMRequest {
    // Base url
    // Endpoint
    // Path components
    // Query parameters
    
    private struct Constants {
        /// API constants
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    let endpoint: RMEndpoint
    
    /// Path components for API, if any
    let pathComponents: Set<String>
    
    /// Query parameters for API, if any
    let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in String format
    public var urlString: String {
        var url: String = "\(Constants.baseUrl)/\(endpoint.rawValue)"
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                url = "\(Constants.baseUrl)/\(endpoint.rawValue)/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            url += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            url += argumentString
        }
        
        return url
    }
    
    /// Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP method
    public let httpMethod = "GET"
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
