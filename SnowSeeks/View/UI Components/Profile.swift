//
//  Profile.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct Profile: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        List(viewModel.user) { user in
            Section {
                HStack {
                    Image(systemName: "person.crop.rectangle.fill")
                        .font(.system(size: 50))
                    Text(user.username)
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
