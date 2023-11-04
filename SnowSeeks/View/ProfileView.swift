//
//  ProfileView.swift
//  SnowSeeks
//
//  Created by Isaque da Silva on 03/11/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            switch viewModel.profileState {
            case .nonCreated:
                CreateAnAccount()
                    .environmentObject(viewModel)
                    .navigationTitle("Create An Account")
                    .navigationBarTitleDisplayMode(.inline)
            case .loading:
                ProgressView()
            case .created:
                Profile()
                    .environmentObject(viewModel)
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
