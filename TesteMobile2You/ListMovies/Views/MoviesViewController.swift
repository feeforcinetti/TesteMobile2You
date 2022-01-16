//
//  FilmesViewController.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var movies: MoviesView?
    
    var viewModel: MoviesViewModel = MoviesViewModel()
    
    var movieHeader: HeaderMovie?
    
    var listMovies: [Result] = []
    
    override func loadView() {
        self.movies = MoviesView()
        self.view = movies
        self.movies?.configTableViewProtocols(delegate: self, datasource: self)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movies?.configDelegate(delegate: self)
        viewModel.fetchMovie { movie in
            self.movieHeader = movie
            DispatchQueue.main.async {
                self.movies?.tableView.reloadData()
            }
        }
        
        viewModel.fetchListMovies { list in
            self.listMovies = list.results
            DispatchQueue.main.async {
                self.movies?.tableView.reloadData()
                print(self.listMovies)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.movies?.getImage(data: movieHeader)
    }
    
    @objc private func tappedButton() {
        
    }
}

extension MoviesViewController : MoviesViewProtocol {
    func actionButton() {
    }
    
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell
        
        if let cellInfo = cell {
            cellInfo.backgroundColor = .black
            cellInfo.setupCell(data: listMovies[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {

        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow,
            indexPathForSelectedRow == indexPath {
            tableView.deselectRow(at: indexPath, animated: false)
            return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as? MovieHeaderView
        
        if let headerInfo = header {
            headerInfo.setupInfoHeader(data: movieHeader)
        }
 
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
}


