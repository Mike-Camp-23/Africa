//
//  VideoModel.swift
//  Africa
//
//  Created by Michael Camp on 4/12/21.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    
    var thumbnail: String {
        "video-\(id)"
    }
}
