//
//  CreateAnAccount.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct CreateAnAccount: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        Form {
            Section("Insert your informations") {
                TextField("Insert your username", text: $viewModel.username)
            }
        }
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
