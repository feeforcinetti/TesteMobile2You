//
//  FilmesView.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MoviesView: UIView {
    
    private lazy var ImageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .blue
        image.image = UIImage(named: "JhonnyDepp")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
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
    
    func configTableViewProtocols(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
        tableView.reloadData()
    }
    
}

extension MoviesView: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.ImageMovie)
        addSubview(self.tableView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            ImageMovie.topAnchor.constraint(equalTo: self.topAnchor),
            ImageMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ImageMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ImageMovie.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            tableView.topAnchor.constraint(equalTo: ImageMovie.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
