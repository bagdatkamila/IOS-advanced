//
//  HeroView.swift
//  heroApp
//
//  Created by Камила Багдат on 24.03.2025.
//

import SwiftUI

struct HeroView: View {
    @StateObject var viewModel: HeroViewModel
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                searchBar()
                    .padding(.horizontal)

                if viewModel.heroes.isEmpty {
                    loadingView()
                } else {
                    listOfHeroes()
                }
            }
            .navigationTitle("🦸‍♂️ Heroes")
            Spacer()
        }
        .task {
            await viewModel.fetchHeroes()
        }
    }
}

extension HeroView {
    @ViewBuilder
    private func searchBar() -> some View {
        HStack {
            TextField("Search for a hero...", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button(action: {
                // Add search functionality if needed
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func listOfHeroes() -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.heroes) { model in
                    heroCard(model: model)
                }
            }
            .padding()
        }
    }

    @ViewBuilder
    private func heroCard(model: HeroModel) -> some View {
        VStack {
            AsyncImage(url: model.heroImage) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .shadow(radius: 5)

            Text(model.title)
                .font(.headline)
                .foregroundColor(.white)

            Text("Power: \(model.powerstats)")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(width: 160, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .purple]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 5)
        .onTapGesture {
            viewModel.routeToDetail(by: model.id)
        }
    }

    @ViewBuilder
    private func loadingView() -> some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.5)
                .padding()

            Text("Loading heroes...")
                .foregroundColor(.gray)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
