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
    
    var genre = GenreParsing()
    var similarMoviesData = [SimilarMoviesDetails]()
    var delegate: SimilarMovieFetchprotocol?
    @Published private (set) var state: MovieApiCallStatus =  .loadingCompleted
    
    func fetchData(movieID: String?){
        guard movieID != nil else {
            return
        }
        genre.genreJSONParse()
        let url = URL(string: Constants.base_URL+movieID!+Constants.similarMovie_URL)
        state = .loading
        URLSession.shared.getData(url: url, structureType: SimilarMoviesResponse.self)
        { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success( let credit):
                    self?.similarMoviesData = credit.results!
                    self?.delegate!.fetchSimilarMovie(self!.similarMoviesData)
                    self?.state = .loadingCompleted
                case .failure(let error):
                    self?.state = .errorOccured(error)
                }
            }
        }
    }
}

