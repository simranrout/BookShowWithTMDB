//
//  MovieScrollViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 19/08/21.
//

import Foundation
import Combine
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
    var stateObserver :  AnyCancellable?
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        endCreditsFetch()
        configureViewModel()
        
        bookNowButton.layer.cornerRadius = 12
       
    }
    private func configureViewModel(){
        creditsVM.delegate = self
        similarVM.delegate = self
        stateObserver = similarVM.$state.sink(receiveValue: { (state) in
            switch state{
            case .loading:
                break
            case .loadingCompleted:
                break
            case .errorOccured(let error) :
                self.singleMessageAlertView(titleText: "Warning !!!", message: error?.description ?? "N/A", preferredStyle: .alert)
            }
        })
    }
    
    private func endCreditsFetch(){
        //check whether Movie Model is empty or not
        guard updateMovieDetails != nil && updateMovieDetails?.id != nil else {
            return
        }
        let MovieId = String(updateMovieDetails!.id)
        creditsVM.endCreditsFetch(MovieID:MovieId)
        similarVM.fetchData(MovieID: MovieId)
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
        movieLanguageTextLabel.text = updateMovieDetails?.original_language.languageCodeToLanguageName()
        movieReleaseDateTextLabel.text = updateMovieDetails?.release_date.convertToDate()
        
     
        //updating Approval percentage and progress bar value
        updateApprovalAndProgressBar()
        
        if updateMovieDetails?.genre_ids.count != 0{
            let genreId = updateMovieDetails!.genre_ids
            movieGenreTextLabel.text = " * " + GenreParsing.getGenresFromList(genreId)
          
        }
        else {
            movieGenreTextLabel.text = "N/A"
        }
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
        moviePosterImageView.fetchImageFromURL(fetchedurl: imageUrl)
        backgroundImageView.fetchImageFromURL(fetchedurl: imageUrl)
      
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
