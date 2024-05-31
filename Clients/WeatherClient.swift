//
//  WeatherClient.swift
//  Mausam
//
//  Created by Lochan on 22/04/24.
//

import Foundation

struct WeatherClient{
    
    
    func fetchWeather(location: LocationResponse) async throws -> Mausam {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoints.EndpointURL(for: .byCoord(location.lat,location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let weatherResponse = try JSONDecoder() . decode (WeatherResponse.self, from: data)
        return weatherResponse .main
        
    }
    
    
}
