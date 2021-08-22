//
//  ViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit
import PDFKit
class SignInViewController: UIViewController {

    @IBOutlet weak var SignInScrollView: UIScrollView!
    //Variable declaration
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var BackgroundImageView: UIImageView!
    var isScrollViewActive = false
    var KeyboardHeight: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundImageView.alpha = 0.7
        SignInScrollView.showsHorizontalScrollIndicator = false
        SignInScrollView.showsVerticalScrollIndicator = false
        //Added Corner Radius (UI Changes)
        UsernameField.layer.cornerRadius = 22
        Password.layer.cornerRadius = 22
        SignInButton.layer.cornerRadius = 12
        
        addKeyboardTapGesture()
        //call function when keyboard appears or  disappears
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearedOnScreen), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappredOnScreen), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
   
    //Action for Sign Up button (new user)
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        changViewController(storyBoardID: "SignUpVC")
    }
    
 
    
    //Action for Sign In button
    @IBAction func SignInButtonTapped(_ sender: Any) {
        guard UsernameField.text != "" && Password.text != "" else{
            return
        }
        changViewController(storyBoardID: "MainViewVC")
   
        
    }
    @objc func keyboardAppearedOnScreen(_ notification : NSNotification){
         if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            KeyboardHeight = keyboardFrame.cgRectValue.height
            if !isScrollViewActive{
                self.SignInScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.SignInScrollView.frame.height + KeyboardHeight)
                isScrollViewActive = true
            }
               }
     }
     @objc func keyboardDisappredOnScreen(){
         print("height No keyboard" , KeyboardHeight)
        if isScrollViewActive{
            self.SignInScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.SignInScrollView.frame.height - KeyboardHeight)
            isScrollViewActive = false
        }
     }
         
    
}


