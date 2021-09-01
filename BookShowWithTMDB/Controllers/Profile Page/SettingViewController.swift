//
//  SettingViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//

import Foundation
import UIKit
class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    @IBAction func settingButtonTapped(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Are you sure ?", message: "Continue with signout", preferredStyle: .actionSheet)
        let signoutAction = UIAlertAction(title: "Sign Out", style: .default) { _ in
            self.cleanCache()
            self.changViewController(storyBoardID: String(describing: SignInViewController.self ))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(signoutAction)
        actionSheet.addAction(cancelAction)
        actionSheet.view.tintColor = UIColor(named: "Theme Color")
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func cleanCache(){
        ImageCacheManager.cleanImageCache()
        GenreCaching.cleanGenreCache()
    }
    
}
