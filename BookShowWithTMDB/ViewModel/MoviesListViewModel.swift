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
    var page1 = 0
    var maxpage = Int.max
    func movieDataFetch(_ page : Int) {
        page1 += 1
        let url = URL(string: Constants.base_URL + Constants.MovieDetails_URL+String(page))
        URLSession.shared.getData(url: url, structureType: resultModel.self)
        {   [weak self] result in
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
