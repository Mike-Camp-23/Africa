//
//  MapView.swift
//  Africa
//
//  Created by Michael Camp on 4/8/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordiantes = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordiantes, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK: - Body
    
    
    var body: some View {
        
        //MARK: - No1 Basic map
//        Map(coordinateRegion: $region)
        
        //MARK: - No2 Advanced Map
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            //MARK: - (A) Old Style (static)
//            MapPin(coordinate: item.location)
//            MapMarker(coordinate: item.location, tint: .accentColor)
        //MARK: - (B) New Style (Static)
//            MapMarker(coordinate: item.location,tint: .accentColor)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            
            //MARK: - (D) Custon Advanced
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //: Map
        .overlay(
            HStack {
                Image("compass")
                .resizable()
                .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
            
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                            .cornerRadius(8)
                            .opacity(0.6))
            .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
