//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Камила Багдат on 10.04.2025.
//

import Foundation
import SwiftUI

struct WeatherModel: Decodable{
    let location: Location
    let current: Current
    
}

struct Location: Identifiable{
    let name: String
    let country: String
}

struct Current: Identifiable{
    let temp_c: Double
    let condition: Condition
    let wind_kph: Double
    let humidity: Int
    let uv: Double
}

struct Condition: Identifiable{
    let text: String
}
