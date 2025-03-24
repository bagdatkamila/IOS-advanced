//
//  Hero.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String
    let description: String
    let images: HeroImage
    var heroImageURL: URL? {
        URL(string: images.sm)
    }
}

struct HeroImage: Decodable {
    let sm: String
}
