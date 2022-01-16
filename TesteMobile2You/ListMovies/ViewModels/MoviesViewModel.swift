//
//  MoviesViewModel.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 12/01/22.
//

import Foundation

class MoviesViewModel {
    
    var service = MoviesApi()
    
    func fetchMovie(_ completion: @escaping (HeaderMovie) -> Void) {
        service.fetchMovies { movieHeader in
            guard let movies = movieHeader else {return}
            completion(movies)
        }
    }
    
    func fetchListMovies(_ completion: @escaping (ListMovies) -> Void) {
        service.fetchListMovies { list in
            completion(list)
        }
    }
    
}
