//
//  GalleryView.swift
//  Africa
//
//  Created by Michael Camp on 4/8/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - Simple Grid Definition
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    //MARK: - Efficient Grid Layout
    
    
    //MARK: - Dynamic Grid Layout
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    
    //MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: - Grid
        
            VStack(alignment: .center, spacing: 30) {
                //MARK: - Image
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    
                //MARK: - Slider
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }//: Loop
                }//: Grid
                .animation(.easeInOut)
                .onAppear(perform:
                gridSwitch)
                
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }//: Scroll
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
        
    }
}
//MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animal.json")
    static var previews: some View {
        GalleryView()
    }
}
