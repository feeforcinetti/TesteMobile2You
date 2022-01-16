//
//  MoviesModel.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import Foundation
import UIKit

// MARK: - Result

struct ListMovies: Codable {
    var results: [Result] = []
}

struct Result: Codable {
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let title: String?
    let popularity: Double?
    let posterPath, releaseDate: String?
    let voteCount: Int?

}
