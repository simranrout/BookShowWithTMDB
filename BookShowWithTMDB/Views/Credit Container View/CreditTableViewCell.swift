//
//  CreditTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import UIKit

class CreditTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
 
    

    static let identifier = "CreditTableViewCell"
    
    @IBOutlet weak var CreditType: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var CreditModel = [MovieMemberDetails]()
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        collectionView.register(CreditCellCollectionView.nib() , forCellWithReuseIdentifier: CreditCellCollectionView.Identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        print("height of table view", frame.size.height)
    }
    //MARK: - UICollectionViewDelegateFlowLayout

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
          return CGSize(width: 250.0, height: 250.0)
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib{
        return UINib(nibName: CreditTableViewCell.identifier, bundle: nil)
    }
    
    // MARK :- Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("namee index one  ",CreditModel.count)
        return CreditModel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCellCollectionView.Identifier, for: indexPath) as! CreditCellCollectionView
        if indexPath.row == 2{
            cell.configure(with: CreditModel[indexPath.row])
        }
        cell.configure(with: CreditModel[indexPath.row])
        return cell
    }
    
     
    func configure(with model : [MovieMemberDetails] , Type : String){
        self.CreditModel = model
        if CreditModel.count != 0{
            print("namee", CreditModel)
          self.CreditType.text = Type
            self.CreditModel = model
            collectionView.reloadData()
        }
        
       
    }
  
  
    
}
