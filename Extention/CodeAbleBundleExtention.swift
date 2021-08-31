//
//  CodeAbleBundleExtention.swift
//  Africa
//
//  Created by Michael Camp on 4/9/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1 locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        // create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from the bundle.")
        }
        // create a decoder
        let decoder = JSONDecoder()
        // create a property for the docoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle.")
        }
        // return the ready to use date
        return loaded
        
    }
}
