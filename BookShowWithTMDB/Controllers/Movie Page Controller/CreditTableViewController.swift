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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CreditTableViewCell.nib(), forCellReuseIdentifier: CreditTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func updateCreditData(_ CreditData : CreditsDetails){
        self.CastDetails = CreditData.cast!
        self.CrewDetails = CreditData.crew!
        tableView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
   
   
}
