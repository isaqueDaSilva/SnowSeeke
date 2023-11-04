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
            
            if !viewModel.favoriteResortList.isEmpty {
                Section("Favorite Resorts") {
                    ForEach(viewModel.favoriteResortList) { resort in
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
