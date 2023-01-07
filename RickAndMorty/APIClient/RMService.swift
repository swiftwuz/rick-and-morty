//
//  RMService.swift
//  RickAndMorty
//
//  Created by Nana Kojo Ewusie on 07/01/2023.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we want to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        executing type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {}
}
