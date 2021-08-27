//
//  ViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit
import PDFKit
class SignInViewController: UIViewController {

    @IBOutlet weak var signInScrollView: UIScrollView!
    //Variable declaration
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var isScrollViewActive = false
    var keyboardHeight: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.alpha = 0.7
        signInScrollView.showsHorizontalScrollIndicator = false
        signInScrollView.showsVerticalScrollIndicator = false
        //Added Corner Radius (UI Changes)
        usernameField.layer.cornerRadius = 22
        password.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 12
        
        addKeyboardTapGesture()
        //call function when keyboard appears or  disappears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearedOnScreen), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappredOnScreen), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
   
    //Action for Sign Up button (new user)
    @IBAction func signUpButtonTapped(_ sender: Any) {
        changViewController(storyBoardID: "SignUpVC")
    }
    
 
    
    //Action for Sign In button
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard usernameField.text != "" && password.text != "" else{
            return
        }
        changViewController(storyBoardID: "MainViewVC")
   
        
    }
    @objc func keyboardAppearedOnScreen(_ notification: NSNotification){
         if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            keyboardHeight = keyboardFrame.cgRectValue.height
            if !isScrollViewActive{
                self.signInScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.signInScrollView.frame.height + keyboardHeight)
                isScrollViewActive = true
            }
               }
     }
     @objc func keyboardDisappredOnScreen(){
        if isScrollViewActive{
            self.signInScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.signInScrollView.frame.height - keyboardHeight)
            isScrollViewActive = false
        }
     }
         
    
}


