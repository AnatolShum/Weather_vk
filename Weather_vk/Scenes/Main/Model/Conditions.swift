//
//  Conditions.swift
//  Weather_vk
//
//  Created by Anatolii Shumov on 16.07.2024.
//

import Foundation

enum WetherConditions: String, CaseIterable {
    case sunny = "sunny"
    case partlyCloudy = "partlyCloudy"
    case cloudy = "cloudy"
    case rainy = "rainy"
    case drizzle = "drizzle"
    case thunderstorm = "thunderstorm"
    case snowy = "snowy"
    case windy = "windy"
    case foggy = "foggy"
    
    var title: String {
        return self.rawValue
    }
    
    var imageName: String {
        switch self {
        case .sunny:
            return "sun.max"
        case .partlyCloudy:
            return "cloud.sun"
        case .cloudy:
            return "cloud"
        case .rainy:
            return "cloud.rain"
        case .drizzle:
            return "cloud.drizzle"
        case .thunderstorm:
            return "cloud.bolt.rain"
        case .snowy:
            return "cloud.snow"
        case .windy:
            return "wind"
        case .foggy:
            return "cloud.fog"
        }
    }
}
