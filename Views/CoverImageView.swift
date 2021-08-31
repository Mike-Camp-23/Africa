//
//  CoverImageView.swift
//  Africa
//
//  Created by Michael Camp on 4/8/21.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: - Body
    
    
    var body: some View {
        TabView{
            
            ForEach(coverImages) { item in
                Image(item.name)
                          .resizable()
                    .scaledToFill()
            } //: ForEach
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        
      
    }
}

//MARK: - Previews

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
