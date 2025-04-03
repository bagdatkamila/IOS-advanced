//
//  HeroDetailViewModel.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import SwiftUI

final class HeroDetailViewModel: ObservableObject {
    @Published private(set) var heroDetail: HeroModel?

    private let service: HeroService
    private let heroId: Int

    init(service: HeroService, heroId: Int) {
        self.service = service
        self.heroId = heroId
    }

    func fetchHeroDetail() async {
        do {
            let heroesResponse = try await service.fetchHeroes()
            
            if let hero = heroesResponse.first(where: { $0.id == heroId }) {
                await MainActor.run {
                    heroDetail = HeroModel(
                        id: hero.id,
                        title: hero.name,
                        powerstats: hero.powerstats.intelligence ?? 0,
                        biography: hero.biography.alignment ?? "Unknown",
                        appearance: hero.appearance.eyeColor ?? "Unknown",
                        work: hero.work.occupation ?? "Unknown",
                        connections: hero.connections?.groupAffiliation ?? "Unknown",
                        heroImage: hero.heroImageURL
                    )
                }
            } else {
                print("Hero with ID \(heroId) not found.")
            }
        } catch {
            print("Error fetching hero details: \(error.localizedDescription)")
        }
    }
}
