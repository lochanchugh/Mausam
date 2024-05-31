//
//  Weather.swift
//  Mausam
//
//  Created by Lochan on 25/03/24.
//

import Foundation

class WeatherResponse: Decodable{
    let main : Mausam
}

struct Mausam : Decodable{
    let temp: Double
}
