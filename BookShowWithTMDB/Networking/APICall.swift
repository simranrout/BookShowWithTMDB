//
//  APICall.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation

protocol APICallDelegate {
    func resultFetched(_ MoviesData : [MovieModel])
}

class APICall{
   
    var delegate : APICallDelegate?
   func getData(){
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let URLDataTask = session.dataTask(with: url!) { Data, Response, Error in
            
            if Error == nil && Data != nil{
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(resultModel.self, from: Data!)
                    guard result.results != nil else {
                        print("There is no data available")
                        return
                    }
                    
                    DispatchQueue.main.async {
                            self.delegate?.resultFetched(result.results!)
                    }
                    dump(result)
                }
                catch{
                    print("There Is Some Issue In Parsing The JSON File")
                }
        
            }
            
            
        }
        URLDataTask.resume()
        
    }
}
