//
//  SimilarMoviesViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

//MARK: - Protocol For Passing Similar Movies Data
protocol SimilarMovieFetchprotocol  {
    func fetchSimilarMovie(_ similarMovie: [SimilarMoviesDetails] )
}

//MARK: - Fetching Similar Movies
class SimilarMoviesViewModel {
    var similarMoviesData = [SimilarMoviesDetails]()
    var delegate: SimilarMovieFetchprotocol?
    
    func fetchData(MovieID: String){
        let url = URL(string: Constants.base_URL+MovieID+Constants.similarMovie_URL)
        URLSession.shared.getData(url: url, structureType: SimilarMoviesResponse.self)
        { [weak self] result in
            
            switch result{
            case .success( let credit):
                DispatchQueue.main.async {
                    self?.similarMoviesData = credit.results!
                    self?.delegate!.fetchSimilarMovie(self!.similarMoviesData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

