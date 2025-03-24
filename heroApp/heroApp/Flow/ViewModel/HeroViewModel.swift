//
//  HeroViewModel.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import SwiftUI

final class HeroViewModel: ObservableObject {
    @Published private(set) var heroes: [HeroModel] = []
    
    private let service: HeroService
    private let router: HeroRouter
    
    init(service: HeroService, router: HeroRouter) {
        self.service = service
        self.router = router
    }
    
    func fetchHeroes() async {
        do {
            let heroesResponse = try await service.fetchHeroes()
            
            await MainActor.run {
                heroes = heroesResponse.map{
                    HeroModel(
                        id: $0.id,
                        title: $0.name,
                        description: $0.description,
                        heroImage: $0.heroImageURL
                    )
                }
            }
        } catch {
            print("Error fetching heroes: \(error.localizedDescription)")
        }
    }
}
