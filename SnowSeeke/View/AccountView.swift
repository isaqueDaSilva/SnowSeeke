//
//  AccountView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileView.ProfileViewModel
    
    var body: some View {
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
            
            Section("Favorite Resorts:") {
                ForEach(viewModel.user?.favoriteResortList ?? []) { resort in
                    NavigationLink {
                        ResortView(resort: resort, onSave: viewModel.getUser)
                    } label: {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 25)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(resort.name)
                                    .font(.headline)
                                Text("\(resort.runs) runs")
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Profile View")
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
