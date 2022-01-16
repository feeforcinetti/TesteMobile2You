//
//  FilmesView.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit
import Kingfisher

protocol MoviesViewProtocol: AnyObject {
    func actionButton()
}

class MoviesView: UIView {
    
    var delegate: MoviesViewProtocol?
    
     lazy var ImageMovieBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        tableView.register(MovieHeaderView.self, forHeaderFooterViewReuseIdentifier: "MovieHeader")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedButton() {
        self.delegate?.actionButton()
    }
    
    func configDelegate(delegate: MoviesViewProtocol) {
        self.delegate = delegate
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
        tableView.reloadData()
    }
    
    func getImage(data: HeaderMovie?) {
        guard let imageUrl = data?.backdropPath else {return}
        self.ImageMovieBackground.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + imageUrl))
    }
    
}

extension MoviesView: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.ImageMovieBackground)
        addSubview(self.backButton)
        addSubview(self.tableView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            ImageMovieBackground.topAnchor.constraint(equalTo: self.topAnchor),
            ImageMovieBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ImageMovieBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ImageMovieBackground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            
            tableView.topAnchor.constraint(equalTo: ImageMovieBackground.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
