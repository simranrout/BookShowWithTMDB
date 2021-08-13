//
//  ViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit
import PDFKit
class SignInViewController: UIViewController {

    //Variable declaration
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var Password: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundImageView.alpha = 0.7
        EmailField.autocorrectionType = .no
        //Added Corner Radius (UI Changes)
        EmailField.layer.cornerRadius = 22
        Password.layer.cornerRadius = 22
        SignInButton.layer.cornerRadius = 12
        
        // Do any additional setup after loading the view.
    }
    
   
    //Action for Sign Up button (new user)
    @IBAction func SignUpButtonTapped(_ sender: Any) {
      
        changViewController(storyBoardID: "SignUpVC")
        
    }
    
    @IBOutlet weak var BackgroundImageView: UIImageView!
    
    //Action for Sign In button
    @IBAction func SignInButtonTapped(_ sender: Any) {
        guard EmailField.text != "" && Password.text != "" else{
            return
        }
        print("yess" , EmailField.text, Password.text)
        changViewController(storyBoardID: "MainViewVC")
   
        
    }
    
         
    
}

extension UIViewController{
    func changViewController(storyBoardID : String)  {
        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        currentVC.modalPresentationStyle = .fullScreen
        present(currentVC, animated: true, completion: nil)
    }
    
}
