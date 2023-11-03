//
//  CreateAccountView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileView.ProfileViewModel
    var body: some View {
        Form {
            TextField("Insert your username", text: $viewModel.username)
        }
        .navigationTitle("Profile View")
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.createUser()
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
