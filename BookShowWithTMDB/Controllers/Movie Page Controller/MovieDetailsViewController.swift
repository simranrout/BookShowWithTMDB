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
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieDescriptionTextLabel: UILabel!
    @IBOutlet weak var movieTitleTextLabel: UILabel!
    @IBOutlet weak var movieLanguageTextLabel: UILabel!
    @IBOutlet weak var approvalTextLabel: UILabel!
    @IBOutlet weak var bookNowButton: UIButton!
    @IBOutlet weak var movieReleaseDateTextLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var movieGenreTextLabel: UILabel!
    
    var updateMovieDetails: MovieModel?
    var creditDetailsGlobal: CreditsDetails?
    var similarMoviesGlobal: [SimilarMoviesDetails]?
    var averageVote = 0
    var similarVM = SimilarMoviesViewModel()
    var creditsVM = CreditsViewModel()
    var genre = GenreParsing()
    // MARK:- Methods
    override func viewDidLoad() {
       
        endCreditsFetch()
        creditsVM.delegate = self
        similarVM.delegate = self
        super.viewDidLoad()
        bookNowButton.layer.cornerRadius = 12
        genre.genreJSONParse()
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
        movieDescriptionTextLabel.text = ""
        movieTitleTextLabel.text = ""
        moviePosterImageView.image = nil
        approvalTextLabel.text = ""
        
        //check whether Movie Model is empty or not
        guard updateMovieDetails != nil else {
            return
        }
        
        //update Movie Poster
        updateImageView()
    
        //updating the label value
        movieDescriptionTextLabel.text = updateMovieDetails?.overview
        movieTitleTextLabel.text   =    updateMovieDetails?.original_title
        movieLanguageTextLabel.text = updateMovieDetails?.original_language.LanguageCodeToLanguageName()
        movieReleaseDateTextLabel.text = updateMovieDetails?.release_date.convertToDate()
        guard updateMovieDetails?.genre_ids.count != 0 else {
            return
        }
        let genreId = updateMovieDetails!.genre_ids
        movieGenreTextLabel.text = " * " + GenreParsing.getGenresFromList(genreId)
        
     
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
            moviePosterImageView.image = UIImage(systemName: "person.circle")
            return
        }
        let imageUrl = Constants.thumbnailURL + ImageSize.MovieDetailViewImageSize + (updateMovieDetails?.poster_path)!
        moviePosterImageView.FetchImageFromURL(fetchedurl: imageUrl)
        backgroundImageView.FetchImageFromURL(fetchedurl: imageUrl)
      
    }
    
    
   private func updateApprovalAndProgressBar(){
        averageVote = Int(updateMovieDetails!.vote_average * 10)
        approvalTextLabel.text = "Approval - \(averageVote)%"
        progressBar.progress = Float(averageVote)/100.0
    
        if averageVote < 40 {
            progressBar.tintColor = .systemRed
        }
        
        else if averageVote >= 40 && averageVote < 80 {
            progressBar.tintColor = .systemOrange
        }
        
        else {
            progressBar.tintColor = .systemGreen
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
