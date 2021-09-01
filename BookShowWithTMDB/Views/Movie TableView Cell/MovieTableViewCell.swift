//
//  MovieTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 16/08/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleTextLabel: UILabel!
    @IBOutlet weak var movieLanguageTextLabel: UILabel!
    @IBOutlet weak var movieReleaseDateTextLabel: UILabel!
    @IBOutlet weak var bookButton: UILabel!
    
    static var moviePrototypeCellID = String(describing: MovieTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviePosterImageView.layer.cornerRadius = 22       
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayingDataOnCell(_ movieDetailsLocal: MovieModel){
    
        movieTitleTextLabel.text = movieDetailsLocal.original_title
        movieLanguageTextLabel.text = movieDetailsLocal.original_language.languageCodeToLanguageName()
        movieReleaseDateTextLabel.text  = movieDetailsLocal.release_date.convertToDate
        moviePosterImageView.fetchImageFromURL(fetchedurl: movieDetailsLocal.thumbnailURL)
    }
}

