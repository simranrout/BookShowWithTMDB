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
    @IBOutlet weak var payNowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        payNowButton.layer.cornerRadius = 12
    }
    @IBAction func payNowButtonTapped(_ sender: Any) {
    print("Button Tapped")
    }
}
