//
//  FetchingImage.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 17/08/21.
//

import Foundation
 import UIKit
class FetchingImage {
    
    public func FetchImageFromURL(fetchedurl : String , imageView : UIImageView){
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
                        imageView.image = UIImage(systemName: "list.and.film")
                        return
                    }
                    imageView.image = PosterImage
                }
            }
            else{
                DispatchQueue.main.async {
                    imageView.image = UIImage(systemName: "list.and.film")
                }
               
                print("url issue" , url)
            }
        }
        dataTask.resume()
    }
}
