//
//  ResortView.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeClass
    
    @StateObject var viewModel: ResortViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: viewModel.resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        Text("Short By")
                            .bold()
                        Text(viewModel.resort.imageCredit)
                    }
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: -5, y: -5)
                    
                    HStack {
                        if sizeClass == .compact && typeClass > .large {
                            VStack(spacing: 10) { skiDetails }
                            VStack(spacing: 10) { resortDetails }
                        } else {
                            skiDetails
                            resortDetails
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
                        
                        HStack {
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
        }
        .navigationTitle("\(viewModel.resort.name), \(viewModel.resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(viewModel.selectedFacility?.name ?? "More Information", isPresented: $viewModel.showingAlert, presenting: viewModel.selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
        .toolbar {
            Button {
                viewModel.isAFavoriteResort() ? viewModel.removeToFavoriteList() : viewModel.addToFavoriteList()
            } label: {
                Image(systemName: viewModel.isAFavoriteResort() ? "bookmark.fill" : "bookmark")
            }
        }
    }
    
    init(resort: Resort, onSave: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: ResortViewModel(resort: resort, onSave: onSave))
    }
}
