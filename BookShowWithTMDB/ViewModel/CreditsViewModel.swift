//
//  CreditsViewModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

protocol CreditsFetchprotocol  {
    func fetchCredits(_ creditDetails : CreditsDetails?)
}

class CreditsViewModel {
    
    var CreditDetailsGlobal : CreditsDetails?
    var delegate : CreditsFetchprotocol?
    func endCreditsFetch(MovieID : String?){
        //check whether Movie Model is empty or not
            let url = URL(string: Constants.base_URL+MovieID!+Constants.credit_URL)
            URLSession.shared.getData(url: url, structureType: CreditsDetails.self) { [weak self] result in
                switch result{
                case .success(let CreditsDetails):
                    DispatchQueue.main.async {
                        self?.CreditDetailsGlobal = CreditsDetails
                        self?.delegate?.fetchCredits(self?.CreditDetailsGlobal)
                    }
                  
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
