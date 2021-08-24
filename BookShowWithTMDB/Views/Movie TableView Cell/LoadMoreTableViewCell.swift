//
//  LoadMoreTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class LoadMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var loadMore: UIActivityIndicatorView!
    static var LoadMorePrototypeCellID = "LoadMoreTableViewCell"
    
   static func nib() -> UINib{
        return UINib(nibName: "LoadMoreTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
 
 
