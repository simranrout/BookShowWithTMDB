//
//  SimilarMoviesCollectionViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {

    //MARK: - Outlet declaration
    
    @IBOutlet weak var SimilarMovieImageView: UIImageView!
    @IBOutlet weak var MovieTitleTextLabel: UILabel!
    @IBOutlet weak var LanguageTextLabel: UILabel!
    @IBOutlet weak var ReleaseDate: UILabel!
    
    //MARK: - collectionview ID and nib
    
    static var identifier = "SimilarMoviesCollectionViewCell"
    static func nib()-> UINib{
        return UINib(nibName: "SimilarMoviesCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with similarMoviesModel : SimilarMoviesDetails){
        let ImageUrl = Constants.thumbnailURL+ImageSize.MovieTableViewImageSize+similarMoviesModel.poster_path!
        SimilarMovieImageView.FetchImageFromURL(fetchedurl: ImageUrl)
        MovieTitleTextLabel.text = similarMoviesModel.original_title
        LanguageTextLabel.text = similarMoviesModel.original_language.LanguageCodeToLanguageName()
        ReleaseDate.text = similarMoviesModel.release_date.convertToDate()
    }
}
