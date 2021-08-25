//
//  ImageCacheManager.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 25/08/21.
//

import Foundation
class ImageCacheManager{
    
    static var imageCache = [String:Data]()
    
    static func setImageInCache(_ url: String , _ imageData: Data?){
        
        imageCache[url] = imageData
        
    }
    
    static func getImageFromCache(_ url: String) -> Data?{
        return imageCache[url]
    }
}
