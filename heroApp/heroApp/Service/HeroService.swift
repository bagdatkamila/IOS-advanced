//
//  HeroService.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import Foundation

protocol HeroService {
    func fetchHeroes() async throws -> [Hero]
}

struct HeroServiceImpl: HeroService {
    func fetchHeroes() async throws -> [Hero] {
        let urlString = Constants.baseURL + "all.json"
        guard let url = URL(string: urlString) else {
            throw HeroError.wrongURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse?.statusCode ?? 0)
            
            let heroes = try JSONDecoder().decode([Hero].self, from: data)
            return heroes
            
        }catch{
            print(error)
            throw HeroError.somethingWentWrong
        }
    }
}

enum HeroError: Error {
    case wrongURL
    case somethingWentWrong
}

private enum Constants {
    static let baseURL: String = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/"
}
