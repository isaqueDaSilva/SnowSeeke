//
//  ResortDetails.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

extension ResortView {
    @ViewBuilder var resortDetails: some View {
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
}
