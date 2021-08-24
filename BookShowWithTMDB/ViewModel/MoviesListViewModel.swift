//
//  MoviesListViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

protocol MoviesListFetchprotocol  {
    func fetchMovieList(_ results : [MovieModel])
}
class MoviesListViewModel{
    
    var movieResults = [MovieModel]()
    var delegate : MoviesListFetchprotocol?
    func movieDataFetch() {
        let url = URL(string: Constants.base_URL + Constants.MovieDetails_URL)
        URLSession.shared.getData(url: url, structureType: resultModel.self) { [weak self] result in
            switch result{
            case .success(let resultModel):
                DispatchQueue.main.async {
                    self?.movieResults = resultModel.results!
                    self?.delegate?.fetchMovieList(self!.movieResults)
                }
                
                
            case .failure(let error):
                print(error)
            
            }
        }
       
    }
}
