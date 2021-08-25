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
 
   
    var MovieDetailsGlobal : MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
       
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayingDataOnCell(_ MovieDetailsLocal : MovieModel){
        
        self.MovieDetailsGlobal = MovieDetailsLocal
        guard self.MovieDetailsGlobal != nil else {
            return
        }
        BookButton.layer.cornerRadius = 12
        MovieTitleTextLabel.text = MovieDetailsGlobal?.original_title
        MovieLanguageTextLabel.text = MovieDetailsGlobal?.original_language.LanguageCodeToLanguageName()
        
    
        MovieReleaseDateTextLabel.text  = MovieDetailsGlobal?.release_date.convertToDate()
        
        guard MovieDetailsGlobal!.poster_path != nil else {
            return
        }
        var imageURL = Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + (MovieDetailsGlobal!.poster_path)!
        MoviePosterImageView.FetchImageFromURL(fetchedurl: imageURL)
    }
   
    
   
        
}

