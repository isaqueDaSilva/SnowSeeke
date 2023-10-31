//
//  ResortView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    @EnvironmentObject var favorites: Favorites
    @StateObject var viewModel: ResortViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: viewModel.resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) { SkiDetailsView(resort: viewModel.resort) }
                        VStack(spacing: 10) { ResortDetailsView(resort: viewModel.resort) }
                    } else {
                        SkiDetailsView(resort: viewModel.resort)
                        ResortDetailsView(resort: viewModel.resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                Group {
                    Text(viewModel.resort.description)
                        .padding(.vertical)
                    
                    Divider()
                        .padding(.bottom)
                    
                    Text("Facilities:")
                        .font(.headline)
                    
                    HStack() {
                        ForEach(viewModel.resort.facilityTypes) { facility in
                            Button {
                                viewModel.displayFacilityInformation(facility: facility)
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(viewModel.resort.name), \(viewModel.resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(viewModel.selectedFacility?.name ?? "More information", isPresented: $viewModel.showingFacility, presenting: viewModel.selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
        .toolbar {
            Button {
                if favorites.contains(viewModel.resort) {
                    favorites.remove(viewModel.resort)
                } else {
                    favorites.add(viewModel.resort)
                }
            } label: {
                Image(systemName: favorites.contains(viewModel.resort) ? "bookmark.fill" : "bookmark")
            }

        }

    }
    
    init(resort: Resort) {
        _viewModel = StateObject(wrappedValue: ResortViewModel(resort: resort))
    }
}
