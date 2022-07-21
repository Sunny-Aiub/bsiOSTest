//
//  ContentView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MovieSearchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
