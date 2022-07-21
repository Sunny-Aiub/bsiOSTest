//
//  MovieThumbnailView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI

enum MovieThumbnailType{
    case poster
}
struct MovieThumbnailView: View {
    let movie : Movie
    var thumbnailType : MovieThumbnailType = .poster
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        containerView
        .onAppear {
            switch thumbnailType {
            case .poster:
                self.imageLoader.loadImage(with: self.movie.posterURL)
            }
        }
    }
    @ViewBuilder
    private var containerView: some View {
        if case .poster = thumbnailType {
            imageView
        }
    }
    
    private var imageView : some View{
        ZStack {
            Color.gray.opacity(0.3)
            
            if let image = imageLoader.image{
                Image(uiImage: image).resizable().scaledToFill().layoutPriority(-1)
            }else{
                Image(systemName: "film")
            }
        }
        .cornerRadius(8)
        .shadow( radius: 4)
    }
}

struct MovieThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieThumbnailView( movie: Movie.sampleMovie, thumbnailType: .poster)
            .frame(width: 204, height: 306)
    }
}
