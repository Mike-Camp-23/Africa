//
//  CenterModifier.swift
//  Africa
//
//  Created by Michael Camp on 4/14/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
    
    
}
