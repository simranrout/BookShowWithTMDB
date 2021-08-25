//
//  APICall.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//
import UIKit

extension URLSession {
    
    //MARK:- Generic Function For API Call
    enum CustomError: Error {
        case invalidURL
        case invalidData
    }
    
    func getData<T : Codable>(url: URL? , structureType: T.Type , completion: @escaping (Result<T, Error>)  -> Void){
        
        guard let url = url else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        
        let task = dataTask(with: url) { Data, response, error in
            guard Data != nil else{
                if error != nil{
                    completion(.failure(error!))
                }
                else{
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do{
                let decoder = JSONDecoder()
                let resultModel = try decoder.decode(structureType , from: Data!)
                completion(.success(resultModel))
            }
            catch{
                completion(.failure(error))
            }
    
        }
        task.resume()
    }
}
