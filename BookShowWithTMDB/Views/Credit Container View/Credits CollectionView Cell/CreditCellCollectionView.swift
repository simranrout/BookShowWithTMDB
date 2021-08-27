//
//  CastCollectionViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import UIKit

class CreditCellCollectionView: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var genderTextLabel: UILabel!
    @IBOutlet weak var occupationTextLabel: UILabel!
    
    static let Identifier = "CreditCellCollectionView"
    static func nib()-> UINib{
        return UINib(nibName: "CreditCellCollectionView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        castImageView.layer.masksToBounds = true
        castImageView.layer.cornerRadius = 125/2
        castImageView.contentMode = .scaleAspectFill
    }
    
    public func configure(with movieMemberModel: MovieMemberDetails ){
        
        if movieMemberModel.profile_path == nil{
            castImageView.image = UIImage(systemName: "person.circle")!
        }
        else{
            let imageUrl = Constants.thumbnailURL+ImageSize.MovieTableViewImageSize+movieMemberModel.profile_path!
            castImageView.fetchImageFromURL(fetchedurl: imageUrl)
        }
        if movieMemberModel.gender == 1{
            self.genderTextLabel.text = "Female"
        }
        else if movieMemberModel.gender == 2{
            self.genderTextLabel.text = "Male"
        }
        else{
            self.genderTextLabel.text = "Others"
        }

      self.nameTextLabel.text = movieMemberModel.original_name
     self.occupationTextLabel.text = movieMemberModel.known_for_department
        
    }

}

