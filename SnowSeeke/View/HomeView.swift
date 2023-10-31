//
//  HomeView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @StateObject var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $viewModel.searchText, prompt: "Search for a Resort")
        }
        .environmentObject(favorites)
        .phoneOnlyNavigationView()
    }
}
