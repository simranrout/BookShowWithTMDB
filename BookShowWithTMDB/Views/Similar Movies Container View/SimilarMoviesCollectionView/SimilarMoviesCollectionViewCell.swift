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
    
    static var identifier = String(describing: SimilarMoviesCollectionViewCell.self)
    static func nib()-> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with similarMoviesModel: SimilarMoviesDetails){
        movieTitleTextLabel.text = similarMoviesModel.original_title
        languageTextLabel.text = similarMoviesModel.original_language.languageCodeToLanguageName()
        releaseDate.text = similarMoviesModel.release_date.convertToDate
        guard similarMoviesModel.thumbnailURL != "" else {
            similarMovieImageView.image = UIImage(systemName: "person.circle")
            return
        }
        similarMovieImageView.fetchImageFromURL(fetchedurl: similarMoviesModel.thumbnailURL)
    }
}
