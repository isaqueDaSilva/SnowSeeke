//
//  SkiDetailsView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

struct SkiDetailsView: View {
    @StateObject var viewModel: SkiDetailsViewModel
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(viewModel.resort.elevation)m")
                    .font(.title3)
            }
            
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(viewModel.resort.snowDepth)")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    init(resort: Resort) {
        _viewModel = StateObject(wrappedValue: SkiDetailsViewModel(resort: resort))
    }
}

