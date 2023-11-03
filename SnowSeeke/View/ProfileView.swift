//
//  ProfileView.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView {
            switch viewModel.profileState {
            case .nonCreated:
                CreateAccountView()
                    .environmentObject(viewModel)
            case .loading:
                ProgressView()
            case .created:
                AccountView()
                    .environmentObject(viewModel)
            }
        }
    }
}
