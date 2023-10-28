//
//  BundleExtension.swift
//  SnowSeeke
//
//  Created by Isaque da Silva on 28/10/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from bundle.")
        }
        
        return loadedData
    }
}
