//
//  CreditsViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

//MARK: - Protocol For Passing Movie Cast And Crew Details
protocol CreditsFetchprotocol  {
    func fetchCredits(_ creditDetails: CreditsDetails?)
}

//MARK: - Fetching Movie Cast And Crew Details
class CreditsViewModel {
    
    var CreditDetailsGlobal: CreditsDetails?
    var delegate: CreditsFetchprotocol?
    
    func endCreditsFetch(movieID: String?){
        guard movieID != nil else {
            return
        }
        //check whether Movie Model is empty or not
        let url = URL(string: Constants.base_URL+movieID!+Constants.credit_URL)
        URLSession.shared.getData(url: url, structureType: CreditsDetails.self) { [weak self] result in
            switch result{
            case .success(let creditsDetails):
                DispatchQueue.main.async {
                    self?.CreditDetailsGlobal = creditsDetails
                    self?.delegate?.fetchCredits(self?.CreditDetailsGlobal)
                }
                
            case .failure(_):
                break
            }
        }
    }
}
