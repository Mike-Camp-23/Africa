//
//  InsetFactView.swift
//  Africa
//
//  Created by Michael Camp on 4/9/21.
//

import SwiftUI

struct InsetFactView: View {
    
    //MARK: - Properties
    var animal: Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        } //: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
