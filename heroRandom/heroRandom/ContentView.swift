//
//  ContentView.swift
//  heroRandom
//
//  Created by Камила Багдат on 04.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        AsyncImage(url: viewModel.tappedHeroes?.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let images):
                images
                    .resizable()
                    .frame(width: 150, height: 200)
            case .failure(let error):
                Text("Error")
            }
        }
        .frame(width: 200, height: 200)
        .padding(.bottom, 5)
        
        if let hero = viewModel.tappedHeroes {
            Text(hero.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.bottom, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("**Powerstats**")
                    .font(.title2)
                    .fontWeight(.semibold)
                            
                Text("Intelligence: \(hero.powerstats.intelligence)")
                Text("Strength: \(hero.powerstats.strength)")
                Text("Speed: \(hero.powerstats.speed)")
                    .padding(.bottom, 5)
                            
                Text("**Biography**")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Alter Egos: \(hero.biography.alterEgos)")
                Text("Place of Birth: \(hero.biography.placeOfBirth)")
                Text("First Appearance: \(hero.biography.firstAppearance)")
                    .padding(.bottom, 5)
                            
                Text("**Appearance**")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Gender: \(hero.appearance.gender)")
                Text("Eye Color: \(hero.appearance.eyeColor)")
                    .padding(.bottom, 5)
                            
                Text("**Work**")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Occupation: \(hero.work.occupation)")
            }
            .padding([.leading, .trailing])
            .fontDesign(.rounded)
        } else {
            Text("Tap 'Roll Hero' to see a random hero")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
        }
        
        Spacer()
        
        Button {
            Task {
                await viewModel.fetchHeroes()
            }
        } label: {
            Text("Roll Hero")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .shadow(radius: 2)
        }
    }
}

#Preview {
    let viewModel = ViewModel()
    
    ContentView(viewModel: viewModel)
}
