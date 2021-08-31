//
//  VideoView.swift
//  Africa
//
//  Created by Michael Camp on 4/8/21.
//

import SwiftUI

struct VideoListView: View {
    
    //MARK: - Properties
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    //MARK: - Body
    
    
    var body: some View {
        NavigationView {
            List {
                
            
            ForEach(videos) { item in
                NavigationLink(
                    destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            } //: Loop
            .listStyle(InsetListStyle())
            } //: List
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //Shuffle Vidoes
                        videos.shuffle()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: Navigation
        .navigationBarTitle("Vidoes", displayMode: .inline)
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
