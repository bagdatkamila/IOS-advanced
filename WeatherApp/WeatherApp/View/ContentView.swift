//
//  ContentView.swift
//  WeatherApp
//
//  Created by Камила Багдат on 10.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: WeatherViewModel
    
}

#Preview {
    ContentView(viewModel: WeatherViewModel())
}
