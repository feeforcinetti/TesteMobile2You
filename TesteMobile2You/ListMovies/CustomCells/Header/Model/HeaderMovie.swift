//
//  HeaderMovieModel.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 13/01/22.
//

import Foundation

struct HeaderMovie: Codable {
    let posterPath: String?
    let belongsToCollection: BelongsToCollection
    let popularity: Double?
    let voteCount: Double?
}

struct BelongsToCollection: Codable {
    let name: String?
}
