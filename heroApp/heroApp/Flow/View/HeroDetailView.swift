//
//  HeroDetailView.swift
//  heroApp
//
//  Created by Камила Багдат on 27.03.2025.
//

import SwiftUI

struct HeroDetailView: View {
    @StateObject private var viewModel: HeroDetailViewModel

    init(heroId: Int, service: HeroService) {
        _viewModel = StateObject(wrappedValue: HeroDetailViewModel(service: service, heroId: heroId))
    }

    var body: some View {
        ScrollView {
            if let hero = viewModel.heroDetail {
                VStack(alignment: .leading, spacing: 16) {
                    // Изображение героя
                    AsyncImage(url: hero.heroImage) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .cornerRadius(16)

                    // Имя героя
                    Text(hero.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // Основная информация
                    HeroDetailRow(title: "Intelligence", value: "\(hero.powerstats)")
                    HeroDetailRow(title: "Alignment", value: hero.biography)
                    HeroDetailRow(title: "Eye Color", value: hero.appearance)
                    HeroDetailRow(title: "Occupation", value: hero.work)
                    HeroDetailRow(title: "Affiliations", value: hero.connections)
                }
                .padding()
            } else {
                ProgressView()
                    .onAppear {
                        Task {
                            await viewModel.fetchHeroDetail()
                        }
                    }
            }
        }
        .navigationTitle("Hero Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Компонент для отображения строки информации
struct HeroDetailRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text("\(title):")
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

