//
//  ResortDetailsView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

struct ResortDetailsView: View {
    @StateObject var viewModel: ResortDetailsViewModel
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(viewModel.size)
                    .font(.title3)
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(viewModel.price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    init(resort: Resort) {
        _viewModel = StateObject(wrappedValue: ResortDetailsViewModel(resort: resort))
    }
}
