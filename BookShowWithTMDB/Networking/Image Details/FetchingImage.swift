//
//  FetchingImage.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 17/08/21.
//

import Foundation
import UIKit

extension UIImageView{
    
    func FetchImageFromURL(fetchedurl : String){
        let url = URL(string: fetchedurl )
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { Data, Response, Error in
            if Error == nil && Data != nil {
                let PosterImage =  UIImage(data: Data!)
                DispatchQueue.main.async {
                    guard PosterImage != nil else {
                        self.image = UIImage(systemName: "person.circle")
                        return
                    }
                    self.image = PosterImage
                }
            }
            else{
                DispatchQueue.main.async {
                    self.image = UIImage(systemName: "person.circle")
                }
            }
        }
        dataTask.resume()
    }
}
