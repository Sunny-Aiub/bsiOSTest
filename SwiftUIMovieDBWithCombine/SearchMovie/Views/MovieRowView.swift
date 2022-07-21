//
//  MovieRowView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI


struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            MovieThumbnailView(movie: movie, thumbnailType: .poster)
                .frame(width: 61, height: 92)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.overview)
                    .font(.subheadline)
                
            }
        }
    }
}


struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.sampleMovie)
    }
}
