//
//  MoviesApi.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 13/01/22.
//

import Foundation

protocol MoviesApiProtocol: AnyObject {
    func fetchMovies(_ completion: @escaping (HeaderMovie?) -> Void)
    func fetchListMovies(_ completion: @escaping (ListMovies?) -> Void)
}

struct MoviesApi {
    
    func fetchMovies(_ completion: @escaping (HeaderMovie?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/438695?api_key=2adc9215bcb6717282355583e7a61c24&language=en-US") else {return}
        self.performRequest(url, completion)
    }
    
    func fetchListMovies(_ completion: @escaping (ListMovies?) -> Void) {
        guard let url = URL(string: "") else {return}
        self.performRequest(url, completion)
    }
    
    func performRequest<T: Codable>(_ url: URL, _ completion: @escaping(T?) -> Void) {
        
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
                    let pokedex = try jsonDecoder.decode(T.self, from: data)
                    completion(pokedex)
                }catch{
                    print(error.localizedDescription)

                }
            }
            
        }
        dataTask.resume()
    }
}
