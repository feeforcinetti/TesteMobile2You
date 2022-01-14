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
    
     lazy var likes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "1.2 Likes"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white

        return label
    }()
    
     lazy var watched: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .black
        label.text = "3 of 10 watched"
        label.font = UIFont.systemFont(ofSize: 15)
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
    
    @objc private func tappedButton() {
        button.isSelected = !button.isSelected
        self.button.setImage(UIImage(named: button.isSelected ? "like" : "heart"), for: .normal)
    }
}

extension MovieHeaderView: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.titleMovies)
        addSubview(self.likes)
        addSubview(self.watched)
        addSubview(self.button)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            titleMovies.topAnchor.constraint(equalTo: self.topAnchor),
            titleMovies.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            titleMovies.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
            
            likes.topAnchor.constraint(equalTo: self.titleMovies.bottomAnchor, constant: 4),
            likes.leadingAnchor.constraint(equalTo: self.titleMovies.leadingAnchor),
           
            watched.centerYAnchor.constraint(equalTo: self.likes.centerYAnchor),
            watched.leadingAnchor.constraint(equalTo: self.likes.trailingAnchor, constant: 15),
            
            button.topAnchor.constraint(equalTo: self.titleMovies.topAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.widthAnchor.constraint(equalTo: self.heightAnchor)
           
        ])
    }
    
    
}
