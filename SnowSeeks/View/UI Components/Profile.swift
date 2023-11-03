//
//  Profile.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

extension ProfileView {
    @ViewBuilder var profile: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.crop.rectangle.fill")
                        .font(.system(size: 50))
                    Text(viewModel.user?.username ?? "")
                        .font(.title2)
                        .padding(.horizontal)
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.deleteUser()
                } label: {
                    Image(systemName: "trash")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }

            }
        }
    }
}
