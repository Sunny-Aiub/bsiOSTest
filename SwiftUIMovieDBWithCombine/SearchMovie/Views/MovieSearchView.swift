//
//  MovieSearchView.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/18/22.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var movieSearchState = MovieSearchState()
    
    var body: some View {
        List {
            ForEach(movieSearchState.movies) { movie in
                MovieRowView(movie: movie).padding(.vertical, 8)
            }
        }
        .searchable(text: $movieSearchState.query, prompt: "Search movies")
        .overlay(overlayView)
        .onAppear { movieSearchState.startObserve() }
        .listStyle(.plain)
        .navigationTitle("Search")
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch movieSearchState.phase {
            
        case .empty:
            if movieSearchState.trimmedQuery.isEmpty {
                EmptyUIView(text: "No movies found", image: Image(systemName: "exclamationmark.shield.fill"))
            } else {
                ProgressView()
            }
            
        case .success(let values) where values.isEmpty:
            EmptyUIView(text: "No results", image: Image(systemName: "film"))
            
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: {
                Task {
                    await movieSearchState.search(query: movieSearchState.query)
                }
            })
            
        default: EmptyView()
        }
    }
    
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
