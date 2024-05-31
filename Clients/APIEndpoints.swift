//
//  APIEndpoints.swift
//  Mausam
//
//  Created by Lochan on 25/03/24.
//

import Foundation

enum APIEndpoints{
    static var baseUrl : String = "http://api.openweathermap.org"
    case byCity(String)
    case byCoord(Double,Double)
    
    private var path: String{
        switch self {
        case .byCity(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(constants.keys.weatherapi)"
            
        case .byCoord(let lat, let lon):
                return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(constants.keys.weatherapi)"
            }
        }
    static func EndpointURL(for endpoint: APIEndpoints) -> URL {
        let endpointpath = endpoint.path
        return URL(string: baseUrl + endpointpath)!
    }
}
