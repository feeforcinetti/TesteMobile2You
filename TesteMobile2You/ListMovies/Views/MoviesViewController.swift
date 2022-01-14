//
//  FilmesViewController.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var movies: MoviesView?
    
    var moviesApi: MoviesApi = MoviesApi()
    
    var listMovies: [ListMovies] = []

    override func loadView() {
        self.movies = MoviesView()
        self.view = movies
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        movies?.configTableViewProtocols(delegate: self, datasource: self)
        
        moviesApi.fetchMovies { movie in
            DispatchQueue.main.async {
                self.movies?.ImageMovie.image = UIImage(named: String(movie?.posterPath ?? ""))
            }
            
        }
      
    }

}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell
        
        cell?.backgroundColor = .black
        cell?.setupCell(data: listMovies[indexPath.row])

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as? MovieHeaderView
        
        self.moviesApi.fetchMovies { movie in
            guard let movie = movie else {return}
            DispatchQueue.main.async {
                header?.titleMovies.text = movie.belongsToCollection.name
                header?.likes.text = String(movie.voteCount ?? 0.0) + " likes"
                header?.watched.text = String(movie.popularity ?? 0.0) + " views"
                tableView.reloadData()
            }
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
}
