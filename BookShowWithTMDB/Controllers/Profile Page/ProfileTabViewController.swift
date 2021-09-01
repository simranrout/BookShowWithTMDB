//
//  ProfileTabViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit

class ProfileTabViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var emailIdTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureComponent()
    }
    
    private func configureComponent(){
        userNameTextLabel.text = UserDefaults.standard.string(forKey: "userName")
        emailIdTextLabel.text = UserDefaults.standard.string(forKey: "emailID")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        changeRootVC()
    }
    private func changeRootVC(){
        guard !AuthenticationManager.shared.isSignedIn else {
            return
        }
        let signInVC = SignInViewController()
        let updatedRootVC = UINavigationController(rootViewController: signInVC)
        present(updatedRootVC, animated: true, completion: nil)
        
    }
    
    /*
     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       Get the new view controller using segue.destination.
        Pass the selected object to the new view controller.
    }
    */

}
