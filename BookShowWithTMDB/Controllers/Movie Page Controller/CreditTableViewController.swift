//
//  CreditTableViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import Foundation
import UIKit

class CreditTableViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var creditDetails : CreditsDetails?
    var similarMovies = [SimilarMoviesDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(CreditTableViewCell.nib(), forCellReuseIdentifier: CreditTableViewCell.identifier)
        tableView.register(SimilarMoviesTableViewCell.nib(), forCellReuseIdentifier: SimilarMoviesTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateCreditData(_ CreditData: CreditsDetails) {
        self.creditDetails = CreditData
        tableView.reloadData()
        
    }
    
    func updateSimilarMoviesData (_  similarData: [SimilarMoviesDetails] ){
        self.similarMovies = similarData
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // First 2 Row Will Consist Details About Cast and Crew of the Movie
        if indexPath.row < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CreditTableViewCell.identifier , for: indexPath) as! CreditTableViewCell
            
            if (creditDetails?.cast?.count) ?? 0  > 0 {
                //First Row will consist of Details About Cast
                if indexPath.row == 0 {
                    cell.configure(with: (creditDetails?.cast)! , typeOfMember: "Cast")
                }
                //Second Row will consist of Details About Crew
                else if indexPath.row == 1{
                    cell.configure(with: (creditDetails?.crew)! , typeOfMember: "Crew")
                }
            }
            
            return cell
        }
        
        // last Row Will Consist Details About Similar Movies
        let cell = tableView.dequeueReusableCell(withIdentifier: SimilarMoviesTableViewCell.identifier, for: indexPath) as! SimilarMoviesTableViewCell
        cell.configure(with: similarMovies)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 2{
            return 270
        }
        else if indexPath.row == 2{
            return 450
        }
        return 0
    }
}
