//
//  SignUpViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import Foundation
import UIKit
class SignUpViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
   
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var SignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserNameField.autocorrectionType = .no
        EmailField.autocorrectionType = .no
        ProfileImageView.layer.masksToBounds = true
        ProfileImageView.layer.cornerRadius = 45
        ProfileImageView.contentMode = .scaleAspectFill
        SignUpButton.layer.cornerRadius = 12
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addTapGestureOnImageView()
    }
    
    //Action For SignUpButton pressed Create user
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        guard  let username = UserNameField.text ,
               let emailID = EmailField.text ,
               !emailID.trimmingCharacters(in: .whitespaces).isEmpty , !username.trimmingCharacters(in: .whitespaces).isEmpty ,
               username.trimmingCharacters(in: .alphanumerics).isEmpty else {
            let alert = UIAlertController(title: "Invalid Input", message: "Please Make Sure to Fill All Fields", preferredStyle: .actionSheet)
            present(alert, animated: true
                    , completion: nil)
            return
        }
        
        guard let password = PasswordField.text ,
              password.count >= 8 ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            let alert = UIAlertController(title: "Invalid Input", message: "Password Must Be More Than 8 Character", preferredStyle: .actionSheet)
            present(alert, animated: true
                    , completion: nil)
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let currentVC = storyboard.instantiateViewController(withIdentifier: "MainViewVC")
        currentVC.modalPresentationStyle = .fullScreen
        present(currentVC, animated: true, completion: nil)
        print("ID and PWD" , EmailField.text , PasswordField.text , UserNameField.text)
    
    }
    
    //Action For SignInButton pressed log in 
    @IBAction func SignInButtonPressed(_ sender: Any) {
//        changViewController(storyBoardID: "SignInVC")
       
       
    }
    
    
    //Action For adding Tap gesture to profile image view
    func addTapGestureOnImageView(){
        /*
         Here in this function we have added tap gesture to our
         profile image , so that we can know the user tapped on the profileimageview
         */
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)) // calling imageViewTapped function
        ProfileImageView.isUserInteractionEnabled = true
        ProfileImageView.addGestureRecognizer(tap)
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let profileImage = info[UIImagePickerController.InfoKey.editedImage] else{
            return
        }
        ProfileImageView.image = profileImage as? UIImage
    }
    
    
}
