//
//  ResortView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

struct ResortView: View {
    @StateObject var viewModel: ResortViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: viewModel.resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    SkiDetailsView(resort: viewModel.resort)
                    ResortDetailsView(resort: viewModel.resort)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                Group {
                    Text(viewModel.resort.description)
                        .padding(.vertical)
                    
                    Divider()
                        .padding(.bottom)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    Text(viewModel.resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(viewModel.resort.name), \(viewModel.resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(resort: Resort) {
        _viewModel = StateObject(wrappedValue: ResortViewModel(resort: resort))
    }
}
