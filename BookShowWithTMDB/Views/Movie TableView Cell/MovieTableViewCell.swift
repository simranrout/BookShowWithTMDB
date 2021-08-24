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
    
    @IBOutlet weak var MovieGenreTextLabel: UILabel!
    
    @IBOutlet weak var MovieReleaseDateTextLabel: UILabel!
    
    @IBOutlet weak var BookButton: UILabel!
    
    static var MoviePrototypeCellID = "MovieTableViewCell"
    let dateFormatter = DateFormatter()
    var FetchingImageInstance = FetchingImage()
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
        MovieGenreTextLabel.text = MovieDetailsGlobal?.original_language
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let date = dateFormatter.date(from: MovieDetailsGlobal!.release_date)
        dateFormatter.dateFormat = "MMM d, yyyy"
        let resultString = dateFormatter.string(from: date!)
        MovieReleaseDateTextLabel.text  = resultString
        
        guard MovieDetailsGlobal!.poster_path != nil else {
            return
        }
        FetchingImageInstance.FetchImageFromURL(fetchedurl: ( Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + (MovieDetailsGlobal!.poster_path)!), imageView:  MoviePosterImageView)
    }
   
    
   
        
}
