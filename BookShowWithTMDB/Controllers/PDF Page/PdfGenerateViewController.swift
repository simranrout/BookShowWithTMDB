//
//  PdfGenerateViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 20/08/21.
//

import Foundation
import UIKit
import PDFKit

class PdfGenerateViewController: UIViewController {
    @IBOutlet weak var PayNowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        PayNowButton.layer.cornerRadius = 12
    }
    @IBAction func PayNowButtonTapped(_ sender: Any) {
    print("Button Tapped")
    }
}
