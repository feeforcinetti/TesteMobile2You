//
//  HeaderMovieModel.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 13/01/22.
//

import Foundation

struct HeaderMovie: Codable {
    let backdropPath: String?
    let posterPath: String?
    let originalTitle: String?
    let popularity: Double?
    let voteCount: Double?
}

