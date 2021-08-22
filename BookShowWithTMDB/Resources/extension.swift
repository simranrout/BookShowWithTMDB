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
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        currentVC.modalPresentationStyle = .fullScreen
        present(currentVC, animated: true, completion: nil)
    }
    
    func singleMessageAlertView(titleText : String , message : String , preferredStyle : UIAlertController.Style ){
        let alert = UIAlertController(title: titleText, message: message , preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true
                , completion: nil)
    }
    
    func addKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard)) // calling imageViewTapped function
        view.addGestureRecognizer(tap)
        
     
    }
    @objc func tapToHideKeyboard(){
        view.endEditing(true)
    }
   
   
}

