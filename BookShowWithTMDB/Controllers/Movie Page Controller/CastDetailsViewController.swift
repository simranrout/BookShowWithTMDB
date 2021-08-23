//
//  CastDetailsViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import Foundation
import UIKit
class CastDeatilsViewController : UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    var castDetails : [MovieMemberDetails]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
   
    func castDetailsUpdate(castDetailsData : [MovieMemberDetails]){
       castDetails = castDetailsData
    }
    
    
    // MARK :- CollectionView Protocol Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCellnew", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell number" , indexPath.row)
    }
}
