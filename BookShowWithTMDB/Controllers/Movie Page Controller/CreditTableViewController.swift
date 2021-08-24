//
//  CreditTableViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import Foundation
import UIKit

class CreditTableViewController : UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var CrewDetails = [MovieMemberDetails]()
    var CastDetails = [MovieMemberDetails]()
    var SimilarMovies = [SimilarMoviesDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(CreditTableViewCell.nib(), forCellReuseIdentifier: CreditTableViewCell.identifier)
        tableView.register(SimilarMoviesTableViewCell.nib(), forCellReuseIdentifier: SimilarMoviesTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateCreditData(_ CreditData : CreditsDetails){
        self.CastDetails = CreditData.cast!
        self.CrewDetails = CreditData.crew!
        tableView.reloadData()
        
    }
    
    func updateSimilarMoviesData (_  similarData : [SimilarMoviesDetails] ){
        self.SimilarMovies = similarData
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CreditTableViewCell.identifier , for: indexPath) as! CreditTableViewCell
            if CrewDetails.count > 0 {
                    if indexPath.row == 1{
                        print("namee index one" , indexPath.row , CrewDetails.count)
                        cell.configure(with: CrewDetails , Type: "Crew")
                    }
                    else if indexPath.row == 0 {
                        print("namee index " , indexPath.row , CastDetails.count)
                        cell.configure(with: CastDetails , Type: "Cast")
                    }
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SimilarMoviesTableViewCell.identifier, for: indexPath) as! SimilarMoviesTableViewCell
        cell.configure(with: SimilarMovies)
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
