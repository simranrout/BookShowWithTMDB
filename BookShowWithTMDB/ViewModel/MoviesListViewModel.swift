//
//  MoviesListViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation


//MARK: - Protocol For Passing The Data
protocol MoviesListFetchprotocol  {
    func fetchMovieList(_ results: [MovieModel])
}

//MARK: - Fetching Movie List
class MoviesListViewModel{
    
    var movieResults = [MovieModel]()
    var delegate: MoviesListFetchprotocol?
    var genreParse = GenreParsing()
    @Published private (set) var state: MovieApiCallStatus =  .loadingCompleted
    
    func movieDataFetch(_ page: Int ) {
        genreParse.genreJSONParse()
        let url = URL(string: Constants.base_URL + Constants.movieDetails_URL+String(page))
        state = .loading
        URLSession.shared.getData(url: url, structureType: resultModel.self)
        {   [weak self] result in
            DispatchQueue.main.async {
            switch result{
           
            case .success(let resultModel):
                
                    self?.movieResults = resultModel.results!
                    self?.delegate?.fetchMovieList(self!.movieResults)
                    self?.state = .loadingCompleted
               
           
            case .failure(let error):
                self?.state = .errorOccured(error)
            }
        }
        }
    }
}
