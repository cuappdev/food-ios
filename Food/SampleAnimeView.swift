//
//  SampleAnimeView.swift
//  Food
//
//  Created by Hanzheng Li on 4/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct SampleAnimeView: View {
    @State var media: Media
    
    var body: some View {
        VStack {
            Text(media.title?.title ?? "?")
            if let url = media.coverImage?.urlLargest {
                WebImage(url: url)
            }
        }.onAppear(perform: {
            Network.getMedia(for: 1) { media in
                self.media = media
            }
        })
    }
}

struct SampleAnimeView_Previews: PreviewProvider {
    static var previews: some View {
        SampleAnimeView(media: Media())
    }
}
