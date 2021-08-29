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
    
    func getData<T: Codable>(url: URL? , structureType: T.Type , completion: @escaping (Result<T, NetworkError>)  -> Void){
        
        guard let url = url else {
            completion(.failure(.badRequest))
            return
        }
        
        let task = dataTask(with: url) { responseData, _ , error in
           
            guard error == nil else{
                completion(.failure(.other(error?.localizedDescription ?? "N/A")))
                return
            }
            guard responseData != nil else{
                completion(.failure(.noJSONData))
                return 
            }
           
            do{
                let decoder = JSONDecoder()
                let resultModel = try decoder.decode(structureType , from: responseData!)
                completion(.success(resultModel))
            }
            catch {
                completion(.failure(.JSONDecoder))
            }
        }
        task.resume()
    }
}
