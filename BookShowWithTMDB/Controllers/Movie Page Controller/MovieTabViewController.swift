//
//  MainViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit

class MovieTabViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    @IBOutlet weak var TableView: UITableView!
    var page = 1
    var page_dummy = 1
    var Results = [MovieModel]()
    var MovieListVM = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making itself as a datasource and delegate of tableview
        TableView.dataSource = self
        TableView.delegate = self
        MovieListVM.delegate = self
        
        //Adding Loadmore cell
        TableView.register(LoadMoreTableViewCell.nib(), forCellReuseIdentifier: LoadMoreTableViewCell.LoadMorePrototypeCellID)
        MovieListVM.movieDataFetch()
    }

    //Passing the data (Movie Model for specific row ) to Movie Details View controller through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          guard TableView.indexPathForSelectedRow != nil else {
              return
          }
        let updatedResult = Results[TableView.indexPathForSelectedRow!.row]
        let MovieDetailsVC =  segue.destination as! MovieDetailsViewController
        MovieDetailsVC.updateMovieDetails = updatedResult
    }
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Results.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if indexPath.row == Results.count{
            let cell = TableView.dequeueReusableCell(withIdentifier: LoadMoreTableViewCell.LoadMorePrototypeCellID, for: indexPath) as! LoadMoreTableViewCell
            //return cell
            if Results.count > 0 {
                
            }
            
            return cell
        }
        
        let cell = TableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.MoviePrototypeCellID, for: indexPath) as! MovieTableViewCell
        cell.displayingDataOnCell(self.Results[indexPath.row])
        //return cell
        return cell
        
      
    }
}

extension MovieTabViewController : MoviesListFetchprotocol{

    func fetchMovieList(_ results: [MovieModel]) {
        self.Results = results
        TableView.reloadData()
    }
    
}

 
