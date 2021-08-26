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
    
    static var moviePrototypeCellID = "MovieTableViewCell"
    var movieDetailsGlobal: MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        moviePosterImageView.layer.cornerRadius = 22       
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayingDataOnCell(_ MovieDetailsLocal: MovieModel){
        
        self.movieDetailsGlobal = MovieDetailsLocal
        guard self.movieDetailsGlobal != nil else {
            return
        }
       
        movieTitleTextLabel.text = movieDetailsGlobal?.original_title
        movieLanguageTextLabel.text = movieDetailsGlobal?.original_language.LanguageCodeToLanguageName()
        
    
        movieReleaseDateTextLabel.text  = movieDetailsGlobal?.release_date.convertToDate()
        
        guard movieDetailsGlobal!.poster_path != nil else {
            return
        }
        let imageURL = Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + (movieDetailsGlobal!.poster_path)!
        moviePosterImageView.FetchImageFromURL(fetchedurl: imageURL)
    }
   
    
   
        
}

