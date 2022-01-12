//
//  FilmesViewController.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var movies: MoviesView?
    
    var moviesList: [Movies] = [Movies(image: UIImage(named: "JhonnyDepp"), title: "Piratas no caribe", subtitle: "Mais ou menos bão"),
                                Movies(image: UIImage(named: "JhonnyDepp"), title: "Piratas no caribe", subtitle: "Mais ou menos bão")
    ]
    
    override func loadView() {
        self.movies = MoviesView()
        self.view = movies
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        movies?.configTableViewProtocols(delegate: self, datasource: self)
    }

}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        
        cell.imageView?.image = moviesList[indexPath.row].image
        cell.textLabel?.text = moviesList[indexPath.row].title
        cell.detailTextLabel?.text = moviesList[indexPath.row].subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as? MovieHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    
}
