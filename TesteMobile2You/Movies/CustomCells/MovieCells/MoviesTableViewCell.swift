//
//  MoviesTableViewCell.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 12/01/22.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier: String = "MoviesTableViewCell"
    
    var moviesTableViewCellScreen: MoviesTableViewCellScreen = MoviesTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Movies) {
        moviesTableViewCellScreen.imageMovie.image = data.image
        moviesTableViewCellScreen.titleLabel.text = data.title
        moviesTableViewCellScreen.descriptionLabel.text = data.subtitle
    }
}

extension MoviesTableViewCell: ConfigViewProtocol {
    func configureSubviews() {
        moviesTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.moviesTableViewCellScreen)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            
            self.moviesTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.moviesTableViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.moviesTableViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.moviesTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
    }
    
    
}
