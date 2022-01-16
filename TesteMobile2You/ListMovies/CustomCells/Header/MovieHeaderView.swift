//
//  MovieHeader.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 11/01/22.
//

import UIKit

class MovieHeaderView: UITableViewHeaderFooterView {
    
    static let identifier: String = "MovieHeader"
    
     lazy var titleMovies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "The Very Best Of Jhonny Depp"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0

        return label
    }()
    
    lazy var iconLike: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "like")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
     lazy var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "1.2 Likes"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white

        return label
    }()
    
    lazy var iconWatched: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "view")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
     lazy var watched: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "3 of 10 watched"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white

        return label
    }()
    
     lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "like"), for: .normal)
        button.imageView?.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
        return button
    }()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupInfoHeader(data: HeaderMovie?) {
        self.likes.text = String(data?.voteCount ?? 0) + " likes"
        self.watched.text = String(data?.popularity ?? 0) + " views"
        self.titleMovies.text = data?.originalTitle
    }
    
    @objc private func tappedButton() {
        button.isSelected = !button.isSelected
        self.button.setImage(UIImage(named: button.isSelected ? "like" : "heart"), for: .normal)
    }
}

extension MovieHeaderView: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.titleMovies)
        addSubview(self.iconLike)
        addSubview(self.likes)
        addSubview(self.iconWatched)
        addSubview(self.watched)
        addSubview(self.button)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleMovies.topAnchor.constraint(equalTo: self.topAnchor),
            titleMovies.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            titleMovies.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            iconLike.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconLike.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconLike.trailingAnchor.constraint(equalTo: self.likes.leadingAnchor, constant: -5),
            iconLike.heightAnchor.constraint(equalToConstant: 14),
            iconLike.widthAnchor.constraint(equalToConstant: 14),
            
            likes.topAnchor.constraint(equalTo: self.titleMovies.bottomAnchor, constant: 4),
            likes.centerYAnchor.constraint(equalTo: self.iconLike.centerYAnchor),
            
            iconWatched.centerYAnchor.constraint(equalTo: self.likes.centerYAnchor),
            iconWatched.leadingAnchor.constraint(equalTo: self.likes.trailingAnchor, constant: 30),
            iconWatched.trailingAnchor.constraint(equalTo: self.watched.leadingAnchor, constant: -5),
            iconWatched.heightAnchor.constraint(equalToConstant: 14),
            iconWatched.widthAnchor.constraint(equalToConstant: 14),
            
            watched.centerYAnchor.constraint(equalTo: self.likes.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: self.titleMovies.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalTo: self.heightAnchor)
           
        ])
    }
    
    
}
