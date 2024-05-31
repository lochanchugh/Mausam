//
//  GeoCodingClient.swift
//  Mausam
//
//  Created by Lochan on 22/04/24.
//

import Foundation

enum NetworkError: Error{
    case invalidResponse
}

struct GeoCodingClient{
    
    func coordinatebycity(_ city : String) async throws -> LocationResponse?{
        let (data, response) = try await URLSession.shared.data(from: APIEndpoints.EndpointURL(for: .byCity(city)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let locations = try JSONDecoder () . decode ([LocationResponse].self, from: data)
        return locations.first
    }
}
