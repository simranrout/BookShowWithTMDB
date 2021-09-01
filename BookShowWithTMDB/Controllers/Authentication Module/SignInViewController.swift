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
    @Published private (set) var isLoggedIn: Bool =  true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
        addKeyboardTapGesture()
        //call function when keyboard appears or  disappears
        signInScrollView.addObserver()
        // Do any additional setup after loading the view.
    }
    func configureViewComponent() {
        backgroundImageView.alpha = 0.7
        signInScrollView.showsHorizontalScrollIndicator = false
        signInScrollView.showsVerticalScrollIndicator = false
        //Added Corner Radius (UI Changes)
        usernameField.layer.cornerRadius = 22
        password.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 12
    }
    
    //Action for Sign Up button (new user)
    @IBAction func signUpButtonTapped(_ sender: Any) {
        changViewController(storyBoardID: String(describing: SignUpViewController.self ))
    }
    
    //Action for Sign In button
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard usernameField?.text != "" && password?.text != "" else{
            return
        }
        changViewController(storyBoardID: "MainViewController")
    }

}
