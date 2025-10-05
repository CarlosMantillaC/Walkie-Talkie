//
//  NetworkService.swift
//  GopeTalkie
//
//  Created by Gopenux on 27/08/25.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    let encoder: JSONEncoder
    let decoder: JSONDecoder
    
    private init() {
        self.encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        self.decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
}
