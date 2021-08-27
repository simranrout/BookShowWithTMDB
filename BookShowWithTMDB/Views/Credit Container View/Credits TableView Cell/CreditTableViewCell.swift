//
//  CreditTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import UIKit

class CreditTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
 
    

    static let identifier = "CreditTableViewCell"
    
    @IBOutlet weak var creditType: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var creditModel = [MovieMemberDetails]()
    
    static func nib() -> UINib{
        return UINib(nibName: CreditTableViewCell.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CreditCellCollectionView.nib() , forCellWithReuseIdentifier: CreditCellCollectionView.Identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    //MARK: - CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return creditModel.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCellCollectionView.Identifier, for: indexPath) as! CreditCellCollectionView
        cell.configure(with: creditModel[indexPath.row])
        return cell
    }
    
     //MARK: - Configure Cell
    func configure(with movieMemberModelList: [MovieMemberDetails] , typeOfMember: String){
        self.creditModel = movieMemberModelList
        if creditModel.count != 0{
            self.creditType.text = typeOfMember
            self.creditModel = movieMemberModelList
            collectionView.reloadData()
        }
    }
}
