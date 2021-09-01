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
    
    static let Identifier = String(describing: CreditCellCollectionView.self)
    static func nib()-> UINib{
        return UINib(nibName: Identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        castImageView.layer.masksToBounds = true
        castImageView.layer.cornerRadius = 125/2
        castImageView.contentMode = .scaleAspectFill
    }
    
    public func configure(with movieMemberModel: MovieMemberDetails ){
        self.genderTextLabel.text = movieMemberModel.genderName
        self.nameTextLabel.text = movieMemberModel.original_name
        self.occupationTextLabel.text = movieMemberModel.known_for_department
        castImageView.fetchImageFromURL(fetchedurl: movieMemberModel.profileURL)
    }

}

