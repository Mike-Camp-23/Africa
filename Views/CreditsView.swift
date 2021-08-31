//
//  CreditsView.swift
//  Africa
//
//  Created by Michael Camp on 4/14/21.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - Properites
    
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Mike Camp
    All rights reserved
    Better Apps  ♡  Less Code
    """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}


//MARK: - Preview

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
