//
//  ContentView.swift
//  pinterest2
//
//  Created by Камила Багдат on 03.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ImageViewModel
    @State var searchText: String = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                TextField("Search", text: $searchText)
                                    .padding(10)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .shadow(radius: 3)
                                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.images) { model in
                            model.image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 5)
                        }
                    }
                    .padding()
                }
                .onAppear() {
                    viewModel.getImage()
                }
                .scrollIndicators(.hidden)
                
                Button(action: {
                    viewModel.getImage()
                }) {
                    HStack {
                        Text("Download More")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 3)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ImageViewModel())
}
