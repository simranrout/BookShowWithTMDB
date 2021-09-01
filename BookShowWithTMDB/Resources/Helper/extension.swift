//
//  extension.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation
import UIKit

extension UIViewController{
    func changViewController(storyBoardID: String)  {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        currentVC.modalPresentationStyle = .fullScreen
        present(currentVC, animated: true, completion: nil)
    }
    
    func singleMessageAlertView(titleText: String , message: String , preferredStyle: UIAlertController.Style ){
        let alert = UIAlertController(title: titleText, message: message , preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true
                , completion: nil)
        alert.view.tintColor = UIColor(named: "Theme Color")
    }
    func addKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard)) // calling imageViewTapped function
        view.addGestureRecognizer(tap)
        
     
    }
    @objc func tapToHideKeyboard(){
        view.endEditing(true)
    }
   
   
}

extension String{
    func languageCodeToLanguageName() -> String{
      return  NSLocale.current.localizedString(forLanguageCode: self) ?? "N/A"
    }
    
    var convertToDate: String{
        guard  self != "" else {
            return "N/A"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMM d, yyyy"
        guard date != nil else {
            return "N/A"
        }
        let resultString = dateFormatter.string(from: date!)
        
        return resultString
    }
}
extension UIScrollView {
    func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearedOnScreen), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappredOnScreen), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardAppearedOnScreen(_ notification: NSNotification ) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.contentSize = CGSize(width: self.frame.width, height: self.frame.height + keyboardHeight)
        }
    }
    
    @objc func keyboardDisappredOnScreen(isScrollViewActive: Bool , keyboardHeight: CGFloat){
    self.contentSize = CGSize(width: self.frame.width, height: self.frame.height - keyboardHeight)
    }
}

