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
    let slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections?
    let images: HeroImage
    var heroImageURL: URL? {
        URL(string: images.sm)
    }
    
    struct HeroImage: Decodable {
        let sm: String
    }
    
    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Decodable {
        let gender: String
        let race: String?
        let height: [String]
        let weight: [String]
        let eyeColor: String
        let hairColor: String
    }
    
    struct Biography: Decodable {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String?
        let alignment: String
    }
    
    struct Work: Decodable {
        let occupation: String
        let base: String
    }
    
    struct Connections: Decodable {
        let groupAffiliation: String?
        let relatives: String?
    }
    
}

//"id": 1,
//    "name": "A-Bomb",
//    "slug": "1-a-bomb",
//    "powerstats": {
//      "intelligence": 38,
//      "strength": 100,
//      "speed": 17,
//      "durability": 80,
//      "power": 24,
//      "combat": 64
//    },
//    "appearance": {
//      "gender": "Male",
//      "race": "Human",
//      "height": [
//        "6'8",
//        "203 cm"
//      ],
//      "weight": [
//        "980 lb",
//        "441 kg"
//      ],
//      "eyeColor": "Yellow",
//      "hairColor": "No Hair"
//    },
//    "biography": {
//      "fullName": "Richard Milhouse Jones",
//      "alterEgos": "No alter egos found.",
//      "aliases": [
//        "Rick Jones"
//      ],
//      "placeOfBirth": "Scarsdale, Arizona",
//      "firstAppearance": "Hulk Vol 2 #2 (April, 2008) (as A-Bomb)",
//      "publisher": "Marvel Comics",
//      "alignment": "good"
//    },
//    "work": {
//      "occupation": "Musician, adventurer, author; formerly talk show host",
//      "base": "-"
//    },
//    "connections": {
//      "groupAffiliation": "Hulk Family; Excelsior (sponsor), Avengers (honorary member); formerly partner of the Hulk, Captain America and Captain Marvel; Teen Brigade; ally of Rom",
//      "relatives": "Marlo Chandler-Jones (wife); Polly (aunt); Mrs. Chandler (mother-in-law); Keith Chandler, Ray Chandler, three unidentified others (brothers-in-law); unidentified father (deceased); Jackie Shorr (alleged mother; unconfirmed)"
//    }
