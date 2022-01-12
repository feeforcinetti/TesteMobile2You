//
//  MovieHeader.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MovieHeaderView: UITableViewHeaderFooterView {
    
    static let identifier: String = "MovieHeader"
    
    private lazy var titleMovies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "The Very Best Of Jhonny Depp"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "1.2 Likes"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white

        return label
    }()
    
    private lazy var watched: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "3 of 10 watched"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white

        return label
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieHeaderView: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.titleMovies)
        addSubview(self.likes)
        addSubview(self.watched)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleMovies.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            titleMovies.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            titleMovies.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -4),
            
            likes.topAnchor.constraint(equalTo: self.titleMovies.bottomAnchor, constant: 8),
            likes.leadingAnchor.constraint(equalTo: self.titleMovies.leadingAnchor),
            likes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            watched.centerYAnchor.constraint(equalTo: self.likes.centerYAnchor),
            watched.leadingAnchor.constraint(equalTo: self.likes.trailingAnchor, constant: 15),
            watched.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ])
    }
    
    
}
