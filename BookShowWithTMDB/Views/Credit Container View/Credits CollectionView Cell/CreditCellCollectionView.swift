//
//  CastCollectionViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 23/08/21.
//

import UIKit

class CreditCellCollectionView: UICollectionViewCell {

    @IBOutlet weak var CastImageView: UIImageView!
    @IBOutlet weak var NameTextLabel: UILabel!
    @IBOutlet weak var GenderTextLabel: UILabel!
    @IBOutlet weak var OccupationTextLabel: UILabel!
    
    static let Identifier = "CreditCellCollectionView"
    static func nib()-> UINib{
        return UINib(nibName: "CreditCellCollectionView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CastImageView.layer.masksToBounds = true
        CastImageView.layer.cornerRadius = 125/2
        CastImageView.contentMode = .scaleAspectFill
    }
    
    public func configure(with movieMemberModel: MovieMemberDetails ){
        
        if movieMemberModel.profile_path == nil{
            CastImageView.image = UIImage(systemName: "person.circle")!
        }
        else{
            let imageUrl = Constants.thumbnailURL+ImageSize.MovieTableViewImageSize+movieMemberModel.profile_path!
            CastImageView.FetchImageFromURL(fetchedurl: imageUrl)
        }
        if movieMemberModel.gender == 1{
            self.GenderTextLabel.text = "Female"
        }
        else if movieMemberModel.gender == 2{
            self.GenderTextLabel.text = "Male"
        }
        else{
            self.GenderTextLabel.text = "Others"
        }

      self.NameTextLabel.text = movieMemberModel.original_name
     self.OccupationTextLabel.text = movieMemberModel.known_for_department
        
    }

}

