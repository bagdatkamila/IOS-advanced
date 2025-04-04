//
//  ViewModel.swift
//  heroRandom
//
//  Created by Камила Багдат on 04.03.2025.
//

import Foundation

struct Hero: Decodable {
    let images: Images
    var imageURL: URL? {
        URL(string: images.md)
    }
    let name: String
    let slug: String
    let powerstats: Powerstats
    let appearance: HeroAppearance
    let biography: HeroBiography
    let work: HeroWork
    
    struct Images: Decodable {
        let md: String
    }
    
    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
    }
    
    struct HeroAppearance: Decodable {
        let gender: String
        let eyeColor: String
    }
    
    struct HeroBiography: Decodable {
        let alterEgos: String
        let placeOfBirth: String
        let firstAppearance: String
    }
    
    struct HeroWork: Decodable {
        let occupation: String
    }
    
}

//ObservableObject — это протокол в Swift, используемый для создания объектов, которые могут быть отслеживаемы в приложении, основанном на архитектуре SwiftUI. Он позволяет отслеживать изменения данных и автоматически обновлять связанные с ними представления (views) в UI.
final class ViewModel: ObservableObject {
    @Published var tappedHeroes: Hero?
//    Этот атрибут позволяет автоматически уведомлять представления о том, что свойство изменилось. Когда вы изменяете значение свойства, помеченного как @Published, все представления, подписанные на этот объект, автоматически обновляются
    
    func fetchHeroes() async {
        
        let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json")!
        let data = try! Data(contentsOf: url)
        let heroes = try! JSONDecoder().decode([Hero].self, from: data)
        let randomHero = heroes.randomElement()
        
        await MainActor.run {
            tappedHeroes = randomHero
        }
//        guard
//            let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json")
//        else {
//            return
//        }
        
        let urlRequest = URLRequest(url: url)
        
////        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let heroes = try JSONDecoder().decode([Hero].self, from: data)
//            let randomHero = heroes.randomElement()
//
//            await MainActor.run {
//                tappedHeroes = randomHero
//            }
////        }
//        catch {
//            print("Error: \(error)")
//        }
    }
}
