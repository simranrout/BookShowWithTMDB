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
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
        // Do any additional setup after loading the view.
    }
    
    
 
    //Action for Sign Up button (new user)
    @IBAction func signUpButtonTapped(_ sender: Any) {
        changViewController(storyBoardID: String(describing: SignUpViewController.self ))
    }
    
    //Action for Sign In button
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard usernameField.text != "" && password.text != "" else{
            return
        }
        
       
        AuthenticationManager.shared.signIn(email: usernameField.text! , password: password.text! ) { result in
            
        }
        
//        changViewController(storyBoardID: "MainViewController")
    }
    
    private func configureViewComponent() {
        errorMessage.alpha = 0
        backgroundImageView.alpha = 0.7
        signInScrollView.showsHorizontalScrollIndicator = false
        signInScrollView.showsVerticalScrollIndicator = false
        //Added Corner Radius (UI Changes)
        usernameField.layer.cornerRadius = 22
        password.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 12
        addKeyboardTapGesture()
        //call function when keyboard appears or  disappears
        signInScrollView.addObserver()
    }
    
}
