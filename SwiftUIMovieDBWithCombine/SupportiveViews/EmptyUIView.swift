//
//  EmptyUIView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI

struct EmptyUIView: View {
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyUIView(text: "No Movies", image: Image(systemName: "film"))
    }
}
