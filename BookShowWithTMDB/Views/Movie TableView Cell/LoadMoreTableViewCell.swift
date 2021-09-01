//
//  LoadMoreTableViewCell.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import UIKit

class LoadMoreTableViewCell: UITableViewCell {

    static var loadMorePrototypeCellID  = String(describing: LoadMoreTableViewCell.self)
    @IBOutlet weak var loadmoreindi: UIActivityIndicatorView!
    static func nib() -> UINib{
        return UINib(nibName: loadMorePrototypeCellID, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
       
            }

    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        loadmoreindi.startAnimating()

    }
}
 
 
