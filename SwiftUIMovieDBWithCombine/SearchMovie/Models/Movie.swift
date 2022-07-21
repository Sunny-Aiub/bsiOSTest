//
//  Movie.swift
//  SwiftUIMovieDBWithCombine
//
//  Created by MACBOOK Pro - WSIT on 7/17/22.
//

import Foundation
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

struct Movie: Codable, Identifiable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case backdropPath
        case overview
    }
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
}

extension Movie {
    
    static var sample_movies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "search_movie")
        return response!.results
    }
    
    static var sampleMovie: Movie {
        sample_movies[0]
    }
    
}


