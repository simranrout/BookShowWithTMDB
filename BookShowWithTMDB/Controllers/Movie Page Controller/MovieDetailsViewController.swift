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
    
    // MARK:- Variable Declaration
    @IBOutlet weak var BackgroundImageView: UIImageView!
    @IBOutlet weak var MoviePosterImageView: UIImageView!
    @IBOutlet weak var MovieDescriptionTextLabel: UILabel!
    @IBOutlet weak var MovieTitleTextLabel: UILabel!
    @IBOutlet weak var MovieLanguageTextLabel: UILabel!
    @IBOutlet weak var ApprovalTextLabel: UILabel!
    @IBOutlet weak var BookNowButton: UIButton!
    @IBOutlet weak var MovieReleaseDateTextLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var updateMovieDetails: MovieModel?
    var creditDetailsGlobal: CreditsDetails?
    var similarMoviesGlobal: [SimilarMoviesDetails]?
    var averageVote = 0
    var similarVM = SimilarMoviesViewModel()
    var creditsVM = CreditsViewModel()
    
    // MARK:- Methods
    override func viewDidLoad() {
       
        endCreditsFetch()
        creditsVM.delegate = self
        similarVM.delegate = self
        super.viewDidLoad()
        BookNowButton.layer.cornerRadius = 12
    }
    
    private func endCreditsFetch(){
        //check whether Movie Model is empty or not
        guard updateMovieDetails != nil && updateMovieDetails?.id != nil else {
            return
        }
        let MovieId = String(updateMovieDetails!.id)
        creditsVM.endCreditsFetch(MovieID:MovieId)
        similarVM.FetchData(MovieID: MovieId)
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
        MovieLanguageTextLabel.text = updateMovieDetails?.original_language.LanguageCodeToLanguageName()
        MovieReleaseDateTextLabel.text = updateMovieDetails?.release_date
     
        //updating Approval percentage and progress bar value
        updateApprovalAndProgressBar()
    
    }
    private func sendDataToChildVC(_ childName: String){
        DispatchQueue.main.async {
            for child in self.children{
                 
                if let childVC = child as? CreditTableViewController {
                    if childName == "Credits"{
                        childVC.updateCreditData((self.creditDetailsGlobal)!)
                    }
                    else if childName == "SimilarMovies"{
                        childVC.updateSimilarMoviesData(self.similarMoviesGlobal!)
                    }
                    
                }
               
            }
        }
    }

  private func updateImageView(){
        
        guard updateMovieDetails?.poster_path != nil else {
            MoviePosterImageView.image = UIImage(systemName: "person.circle")
            return
        }
        let imageUrl = Constants.thumbnailURL + ImageSize.MovieDetailViewImageSize + (updateMovieDetails?.poster_path)!
        MoviePosterImageView.FetchImageFromURL(fetchedurl: imageUrl)
        BackgroundImageView.FetchImageFromURL(fetchedurl: imageUrl)
      
    }
    
    
   private func updateApprovalAndProgressBar(){
        averageVote = Int(updateMovieDetails!.vote_average * 10)
        ApprovalTextLabel.text = "Approval - \(averageVote)%"
        ProgressBar.progress = Float(averageVote)/100.0
    
        if averageVote < 40 {
            ProgressBar.tintColor = .systemRed
        }
        
        else if averageVote >= 40 && averageVote < 80 {
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

//MARK:-  conforms to delegate
extension MovieDetailsViewController: CreditsFetchprotocol  , SimilarMovieFetchprotocol {
   
    func fetchSimilarMovie(_ similarMovie: [SimilarMoviesDetails]) {
        self.similarMoviesGlobal = similarMovie
        sendDataToChildVC("SimilarMovies")
    }
    
    func fetchCredits(_ creditDetails: CreditsDetails?) {
        self.creditDetailsGlobal = creditDetails
        sendDataToChildVC("Credits")
    }
   
}
