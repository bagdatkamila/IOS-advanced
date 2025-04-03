//
//  HeroViewModel.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import SwiftUI

final class HeroViewModel: ObservableObject {
    @Published private(set) var heroes: [HeroModel] = []
    @Published var searchText: String = ""
    
    private let service: HeroService
    private let router: HeroRouter
    
    init(service: HeroService, router: HeroRouter) {
        self.service = service
        self.router = router
    }
    
    func filterHero(by text: String) {
        searchText = text
    }
    
    func fetchHeroes() async {
        do {
            let heroesResponse = try await service.fetchHeroes()
            
            await MainActor.run {
                heroes = heroesResponse.map{
                    HeroModel(
                        id: $0.id,
                        title: $0.name,
                        powerstats: $0.powerstats.combat,
                        biography: $0.biography.alignment,
                        appearance: $0.appearance.eyeColor,
                        work: $0.work.occupation,
                        connections: $0.connections.debugDescription,
                        heroImage: $0.heroImageURL
                    )
                }
            }
        } catch {
            print("Error fetching heroes: \(error.localizedDescription)")
        }
    }
    
    func routeToDetail(by id: Int) {
        router.showDetails(for: id)
    }
}
