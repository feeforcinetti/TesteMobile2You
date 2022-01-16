//
//  MoviesTableViewCellScreen.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 12/01/22.
//

import UIKit

class MoviesTableViewCellScreen: UIView {
    
    lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.lineBreakStrategy = .standard
        return label
    }()
    
    lazy var indicatorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "check"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MoviesTableViewCellScreen: ConfigViewProtocol {
    func configureSubviews() {
        addSubview(self.imageMovie)
        addSubview(self.titleLabel)
        addSubview(self.descriptionLabel)
        addSubview(self.genreLabel)
        addSubview(self.indicatorButton)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            imageMovie.topAnchor.constraint(equalTo: topAnchor),
            imageMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageMovie.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageMovie.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.imageMovie.trailingAnchor,constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.genreLabel.leadingAnchor, constant: -8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            genreLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            genreLabel.centerYAnchor.constraint(equalTo: self.descriptionLabel.centerYAnchor),
            
            indicatorButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            indicatorButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            indicatorButton.heightAnchor.constraint(equalToConstant: 20),
            indicatorButton.widthAnchor.constraint(equalTo: self.indicatorButton.heightAnchor)
            
        ])
    }
    
    
}
