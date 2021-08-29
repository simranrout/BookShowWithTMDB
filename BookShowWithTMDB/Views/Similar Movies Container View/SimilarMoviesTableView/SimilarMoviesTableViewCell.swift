//
//  SimilarMoviesTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class SimilarMoviesTableViewCell: UITableViewCell  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var identifier = "SimilarMoviesTableViewCell"
    var similarMovies = [SimilarMoviesDetails]()
    
    static func nib() -> UINib{
        return UINib(nibName: "SimilarMoviesTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
       collectionViewSetUp()
    
    }
    
    func collectionViewSetUp(){
       
        collectionView.register(SimilarMoviesCollectionViewCell.nib(), forCellWithReuseIdentifier: SimilarMoviesCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    
    }
    
    func configure(with similarMoviesListModel: [SimilarMoviesDetails] ){
        
        if similarMoviesListModel.count != 0{
        
            self.similarMovies = similarMoviesListModel
            collectionView.reloadData()
        
        }
    }
}

extension SimilarMoviesTableViewCell: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    //MARK: - Collection View Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return similarMovies.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimilarMoviesCollectionViewCell.identifier, for: indexPath) as! SimilarMoviesCollectionViewCell
        cell.configure(with: similarMovies[indexPath.row])
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        return CGSize(width: 260, height: 410.0)
    
    }
   
}
