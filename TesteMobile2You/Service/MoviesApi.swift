//
//  MoviesApi.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 13/01/22.
//

import Foundation
import UIKit
import Kingfisher


private var baseUrl: String =  "https://api.themoviedb.org/3/movie/"

private var getDetails: String = "2?api_key=2adc9215bcb6717282355583e7a61c24&language=en-US"

private var getSimiliarMovies: String = "2/similar?api_key=2adc9215bcb6717282355583e7a61c24&language=en-US&page=1"


struct MoviesApi {
    
    func fetchMovies(_ completion: @escaping (HeaderMovie?) -> Void) {
        guard let url = URL(string: baseUrl + getDetails ) else {return}
        self.performRequest(url, completion)
    }
    
    private func performRequest(_ url: URL, _ completion: @escaping(HeaderMovie?) -> Void) {
        
        let sessionConfigure = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfigure)
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    return
                }
                
                guard (200 ... 299).contains(response.statusCode) else {
                    return
                }
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let movies = try jsonDecoder.decode(HeaderMovie.self, from: data)
                    completion(movies)
                }catch{
                    print(error.localizedDescription)

                }
            }
            
        }
        dataTask.resume()
    }
    
    func fetchListMovies(_ completion: @escaping (ListMovies) -> Void) {
        guard let url = URL(string: baseUrl + getSimiliarMovies) else {return}
        self.performRequestList(url, completion)
    }
    
    private func performRequestList(_ url: URL, _ completion: @escaping(ListMovies) -> Void) {
        
        let sessionConfigure = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfigure)
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    return
                }
                
                guard (200 ... 299).contains(response.statusCode) else {
                    return
                }
            }
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let movies = try jsonDecoder.decode(ListMovies.self, from: data)
                    completion(movies)
                    print(data)
                }catch{
                    print(error.localizedDescription)

                }
            }
            
        }
        dataTask.resume()
    }
    
}
