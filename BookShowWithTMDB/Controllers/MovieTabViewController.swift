//
//  MainViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit

class MovieTabViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , APICallDelegate{
   
    @IBOutlet weak var TableView: UITableView!
    var APICallInstance = APICall()
    var Results = [MovieModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making itself as a datasource and delegate of tableview
        TableView.dataSource = self
        TableView.delegate = self
        
        //Making itself as a delegate of APICallDelegate
        APICallInstance.delegate = self
        
        //Requesting An API CALL
        APICallInstance.getData()
    }
    
    // Mark:- Conforms to APICallDelegate to fetch the movie data in background and when the data ready then reload the table view
    func resultFetched(_ MoviesData: [MovieModel]) {
        self.Results = MoviesData
        
        //refresh the tableview with new data
       
            self.TableView.reloadData()
     
        
    }
    
    
    // MARK :- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Results.count)
        return Results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: Constants.MoviePrototypeCellID, for: indexPath)
        
        //Configure the cell with data
        let title = Results[indexPath.row].original_title
        cell.textLabel?.text = title
        
        //return cell
        return cell
        
    }
    
    /*
     Tableview will call this function when user taps on a row
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    

}



 
