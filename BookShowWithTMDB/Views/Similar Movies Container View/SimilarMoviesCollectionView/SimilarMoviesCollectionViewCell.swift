//
//  SimilarMoviesCollectionViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var SimilarMovieImageView: UIImageView!
    
    @IBOutlet weak var MovieTitleTextLabel: UILabel!
    
    @IBOutlet weak var LanguageTextLabel: UILabel!
    
    @IBOutlet weak var ReleaseDate: UILabel!
    
    static var identifier = "SimilarMoviesCollectionViewCell"
    static func nib()-> UINib{
        return UINib(nibName: "SimilarMoviesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with Model : SimilarMoviesDetails){
        guard Model != nil else {
            return
        }

        let fetchImage = FetchingImage()
        fetchImage.FetchImageFromURL(fetchedurl: Constants.thumbnailURL+ImageSize.MovieTableViewImageSize+Model.poster_path!, imageView: SimilarMovieImageView)
        MovieTitleTextLabel.text = Model.original_title
        LanguageTextLabel.text = Model.original_language



        }
    
     

}
