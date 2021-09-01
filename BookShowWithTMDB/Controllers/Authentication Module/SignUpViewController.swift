//
//  SignUpViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import Foundation
import UIKit
class SignUpViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
   
  
    @IBOutlet weak var signUpScrollView: UIScrollView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    var keyboardHeight:CGFloat = 0.0
    var isScrollViewActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField?.autocorrectionType = .no
        emailField?.autocorrectionType = .no
        profileImageView?.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 45
        profileImageView.contentMode = .scaleAspectFill
        signUpButton.layer.cornerRadius = 12

        addKeyboardTapGesture()
        signUpScrollView.addObserver()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addTapGestureOnImageView()
    }
  
    //Action For SignUpButton pressed Create user
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard  let username = userNameField.text ,
               let emailID = emailField.text ,
               !emailID.trimmingCharacters(in: .whitespaces).isEmpty , !username.trimmingCharacters(in: .whitespaces).isEmpty ,
               username.trimmingCharacters(in: .alphanumerics).isEmpty else {
            singleMessageAlertView(titleText: "Invalid Input", message: "Please enter a valid username...", preferredStyle: .actionSheet)
            return
        }
        
        guard let password = passwordField.text ,
              password.count >= 8 ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            singleMessageAlertView(titleText: "Invalid Input", message: "Password Must Be More Than 8 Character", preferredStyle: .actionSheet)
            return
        }
        changViewController(storyBoardID: "MainViewController")
    
    }
    
    //Action For SignInButton pressed log in 
    @IBAction func signInButtonPressed(_ sender: Any) {
        changViewController(storyBoardID: String(describing: SignInViewController.self))
    }
    
    
    //Action For adding Tap gesture to profile image view
    func addTapGestureOnImageView(){
        /*
         Here in this function we have added tap gesture to our
         profile image , so that we can know the user tapped on the profileimageview
         */
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)) // calling imageViewTapped function
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tap)
    }
    
    
    @objc func imageViewTapped(){
        
        /*
         Here in this function we have written logic for event that will
         appear after the user have tapped on profileImageView
         */
        let alert = UIAlertController(title: "Profile Picture", message: "Add Photo", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {
            [weak self] _ in
            
            DispatchQueue.main.async {
                    let picker = UIImagePickerController()
                    picker.sourceType = .photoLibrary
                    picker.allowsEditing = true
                    picker.delegate = self
                    self?.present(picker, animated: true, completion: nil)
                    
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let profileImage = info[UIImagePickerController.InfoKey.editedImage] else{
            return
        }
        profileImageView.image = profileImage as? UIImage
    }
}
