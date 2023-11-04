//
//  HomeView.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort, onSave: viewModel.checkIfUserExist)
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
                        
                        if let user = viewModel.user.first {
                            if user.isAFavoriteResort(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $viewModel.searchText, prompt: "Search for a Resort")
            .toolbar {
                ToolbarItem {
                    HStack {
                        Menu {
                            Picker("Order By", selection: $viewModel.orderBy) {
                                ForEach(OrderBy.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                        }
                        
                        Button {
                            viewModel.showingProfileView = true
                        } label: {
                            Image(systemName: "person.circle")
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingProfileView, onDismiss: viewModel.checkIfUserExist) {
                ProfileView()
            }
        }
    }
}
