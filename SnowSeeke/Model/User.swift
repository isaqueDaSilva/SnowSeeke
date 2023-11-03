//
//  User.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 02/11/23.
//

import Foundation
import SwiftData

@Model
final class User {
    var id = UUID()
    let username: String
    var favoriteResortList = [Resort]()
    
    init(id: UUID = UUID(), username: String, favoriteResortList: [Resort] = [Resort]()) {
        self.id = id
        self.username = username
        self.favoriteResortList = favoriteResortList
    }
}
