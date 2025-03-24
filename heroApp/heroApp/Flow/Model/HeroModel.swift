//
//  HeroModel.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let title: String
    let description: String
    let heroImage: URL?
}
