//
//  SimilarMoviesViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

protocol SimilarMovieFetchprotocol  {
    func fetchSimilarMovie(_ similarMovie : [SimilarMoviesDetails] )
}

class SimilarMoviesViewModel {
    var similarMoviesData = [SimilarMoviesDetails]()
    var delegate : SimilarMovieFetchprotocol?
    
    func FetchData(MovieID : String){
                let url = URL(string: Constants.base_URL+MovieID+Constants.similarMovie_URL)
                URLSession.shared.getData(url: url, structureType: SimilarMoviesResponse.self) { [weak self] result in
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

