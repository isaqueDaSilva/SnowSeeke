//
//  CreateAnAccount.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

extension ProfileView {
    @ViewBuilder var createAnAccount: some View {
        Form {
            TextField("Insert your username", text: $viewModel.username)
        }
        .navigationTitle("Profile View")
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.createProfile()
                } label: {
                    Text("Create")
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
