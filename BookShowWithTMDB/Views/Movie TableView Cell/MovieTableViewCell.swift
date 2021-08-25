//
//  MovieTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 16/08/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var MoviePosterImageView: UIImageView!
    
    @IBOutlet weak var MovieTitleTextLabel: UILabel!
    
    @IBOutlet weak var MovieLanguageTextLabel: UILabel!
    
    @IBOutlet weak var MovieReleaseDateTextLabel: UILabel!
    
    @IBOutlet weak var BookButton: UILabel!
    
    static var MoviePrototypeCellID = "MovieTableViewCell"
 
   
    var movieDetailsGlobal: MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
       
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
        BookButton.layer.cornerRadius = 12
        MovieTitleTextLabel.text = movieDetailsGlobal?.original_title
        MovieLanguageTextLabel.text = movieDetailsGlobal?.original_language.LanguageCodeToLanguageName()
        
    
        MovieReleaseDateTextLabel.text  = movieDetailsGlobal?.release_date.convertToDate()
        
        guard movieDetailsGlobal!.poster_path != nil else {
            return
        }
        var imageURL = Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + (movieDetailsGlobal!.poster_path)!
        MoviePosterImageView.FetchImageFromURL(fetchedurl: imageURL)
    }
   
    
   
        
}

