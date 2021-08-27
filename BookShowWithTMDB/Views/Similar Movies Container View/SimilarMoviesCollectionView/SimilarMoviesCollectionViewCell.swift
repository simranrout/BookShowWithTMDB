//
//  SimilarMoviesCollectionViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlet declaration
    
    @IBOutlet weak var similarMovieImageView: UIImageView!
    @IBOutlet weak var movieTitleTextLabel: UILabel!
    @IBOutlet weak var languageTextLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    //MARK: - collectionview ID and nib
    
    static var identifier = "SimilarMoviesCollectionViewCell"
    static func nib()-> UINib{
        return UINib(nibName: "SimilarMoviesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with similarMoviesModel: SimilarMoviesDetails){
        let imageUrl = Constants.thumbnailURL+ImageSize.MovieTableViewImageSize+similarMoviesModel.poster_path!
        similarMovieImageView.fetchImageFromURL(fetchedurl: imageUrl)
        movieTitleTextLabel.text = similarMoviesModel.original_title
        languageTextLabel.text = similarMoviesModel.original_language.languageCodeToLanguageName()
        releaseDate.text = similarMoviesModel.release_date.convertToDate()
    }
}
