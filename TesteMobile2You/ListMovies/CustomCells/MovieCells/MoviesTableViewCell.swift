//
//  MoviesTableViewCell.swift
//  TesteMobile2You
//
//  Created by Felipe Forcinetti on 12/01/22.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier: String = "MoviesTableViewCell"
    
    var moviesTableViewCellScreen: MoviesTableViewCellScreen = MoviesTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getGenres(index: Int) -> String {
        switch index {
        case 28:
            return "Action"
        case 12:
            return "Adventure"
        case 16:
            return "Animation"
        case 35:
            return "Comedy"
        case 80:
            return "Crime"
        case 99:
            return "Documentary"
        case 18:
            return "Drama"
        case 10751:
            return "Family"
        case 14:
            return "Fantasy"
        case 36:
            return "History"
        case 27:
            return "Horror"
        case 10402:
            return "Music"
        case 9648:
            return "Mystery"
        case 10749:
            return "Romance"
        case 878:
            return "Science Fiction"
        case 10770:
            return "TV Movie"
        case 53:
            return "Thriller"
        case 10752:
            return "War"
        case 37:
            return "Western"
        default:
            return ""
        }
      
    }
    
    public func setupCell(data: Result) {

        var genreText = ""

        if let genreId = data.genreIds {
            genreId.forEach {
                genreText += getGenres(index: $0) + ", "
            }
            self.moviesTableViewCellScreen.genreLabel.text = String(genreText.dropLast(2))
        }
        
        if let releaseD = data.releaseDate {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "yyyy"

            let date: Date? = dateFormatterGet.date(from: releaseD)
            self.moviesTableViewCellScreen.descriptionLabel.text = dateFormatterPrint.string(from: date!)
        }
        
        if let imageUrl = data.posterPath {
            self.moviesTableViewCellScreen.imageMovie.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500" + imageUrl ))
        }
        
        if let title = data.title {
            self.moviesTableViewCellScreen.titleLabel.text = title
        }

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
