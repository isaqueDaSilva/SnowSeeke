//
//  ViewExtension.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
