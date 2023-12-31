//
//  Resort.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 01/11/23.
//

import Foundation

struct Resort: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static func == (lhs: Resort, rhs: Resort) -> Bool {
        lhs.id == rhs.id
    }
}
