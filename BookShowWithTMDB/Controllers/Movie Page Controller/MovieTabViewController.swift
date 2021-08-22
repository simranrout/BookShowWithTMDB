//
//  MainViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit

class MovieTabViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    @IBOutlet weak var TableView: UITableView!
    var Results = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making itself as a datasource and delegate of tableview
        TableView.dataSource = self
        TableView.delegate = self
        movieDataFetch()
    }
    
    func movieDataFetch(){
        let url = URL(string: Constants.base_URL + Constants.MovieDetails_URL)
        URLSession.shared.getData(url: url, structureType: resultModel.self) { [weak self] result in
            switch result{
            case .success(let resultModel):
                DispatchQueue.main.async {
                    self?.Results = resultModel.results!
                    //refresh the tableview with new data
                    self?.TableView.reloadData()
                }
               
            case .failure(let error):
                print(error)
            
            }
        }
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
    
    // MARK :- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: Constants.MoviePrototypeCellID, for: indexPath) as! MovieTableViewCell
       
        cell.displayingDataOnCell(self.Results[indexPath.row])
        //return cell
        return cell
        
    }
}



 
