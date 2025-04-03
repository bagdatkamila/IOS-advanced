//
//  HeroModel.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import Foundation

struct HeroModel: Identifiable {
    let id: Int
    let title: String
    let powerstats: Int
    let biography: String
    let appearance: String
    let work: String
    let connections: String
    let heroImage: URL?
    
}
