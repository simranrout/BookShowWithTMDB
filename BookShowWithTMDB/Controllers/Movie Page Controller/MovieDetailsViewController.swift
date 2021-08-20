//
//  MovieScrollViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 19/08/21.
//

import Foundation
import Foundation
import  UIKit
class MovieDetailsViewController: UIViewController {
    
    // MARK :- Variable Declaration
    @IBOutlet weak var BackgroundImageView: UIImageView!
    @IBOutlet weak var MoviePosterImageView: UIImageView!
    @IBOutlet weak var MovieDescriptionTextLabel : UILabel!
    @IBOutlet weak var MovieTitleTextLabel: UILabel!
    @IBOutlet weak var MovieLanguageTextLabel: UILabel!
    @IBOutlet weak var ApprovalTextLabel: UILabel!
    @IBOutlet weak var BookNowButton: UIButton!
    @IBOutlet weak var MovieReleaseDateTextLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    var fetchImageInstance = FetchingImage()
    var updateMovieDetails : MovieModel?
    var averagevote = 0
    
    // MARK :- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        BookNowButton.layer.cornerRadius = 12
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        //Clearing the previous from the field (if any)
        MovieDescriptionTextLabel.text = ""
        MovieTitleTextLabel.text = ""
        MoviePosterImageView.image = nil
        ApprovalTextLabel.text = ""
        
        //check whether Movie Model is empty or not
        guard updateMovieDetails != nil else {
            return
        }
        
        //update Movie Poster
        updateImageView()
       
        
        //updating the label value
        MovieDescriptionTextLabel.text = updateMovieDetails?.overview
        MovieTitleTextLabel.text   =    updateMovieDetails?.original_title
        MovieLanguageTextLabel.text = updateMovieDetails?.original_language
        MovieReleaseDateTextLabel.text = updateMovieDetails?.release_date
     
        //updating Approval percentage and progress bar value
        updateApprovalAndProgressBar()
    
    }
    
    func updateImageView(){
        guard updateMovieDetails?.poster_path != nil else {
            MoviePosterImageView.image = UIImage(systemName: "person.circle")
            return
        }
        fetchImageInstance.FetchImageFromURL(fetchedurl: ( Constants.thumbnailURL + ImageSize.MovieDetailViewImageSize + (updateMovieDetails?.poster_path)!), imageView: MoviePosterImageView)
        
        
        fetchImageInstance.FetchImageFromURL(fetchedurl: ( Constants.thumbnailURL + ImageSize.MovieDetailViewImageSize + (updateMovieDetails?.poster_path)!), imageView: BackgroundImageView)
      
    }
    
    
    func updateApprovalAndProgressBar(){
        averagevote = Int(updateMovieDetails!.vote_average * 10)
        ApprovalTextLabel.text = "Approval - \(averagevote)%"
        ProgressBar.progress = Float(averagevote)/100.0
    
        if averagevote < 40 {
            ProgressBar.tintColor = .systemRed
           
        }
        else if averagevote >= 40 && averagevote < 80 {
            ProgressBar.tintColor = .systemOrange
        }
        else {
            ProgressBar.tintColor = .systemGreen
        }
    }
    
    @IBAction func BookNowButtonTapped(_ sender: Any) {
        print("buttonTapped")
    }
   
}
