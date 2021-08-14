//
//  extension.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation
import UIKit

extension UIViewController{
    func changViewController(storyBoardID : String)  {
        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        currentVC.modalPresentationStyle = .fullScreen
        present(currentVC, animated: true, completion: nil)
    }
    
}
