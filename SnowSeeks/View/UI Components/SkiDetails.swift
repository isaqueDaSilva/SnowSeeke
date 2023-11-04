//
//  SkiDetails.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct SkiDetails: View {
    @EnvironmentObject var viewModel: ResortViewModel
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
}
