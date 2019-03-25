//
//  InformationTableViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 24.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class InformationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func aboutButton(_ sender: UIButton) {
        openURL(string: "https://www.pyramid-hsa.de/team.php")
    }
    
    @IBAction func facebookButton(_ sender: UIButton) {
        openURL(string: "https://www.facebook.com/Firmenkontaktmesse.Pyramid/")
    }
    
    @IBAction func instagramButton(_ sender: UIButton) {
        openURL(string: "https://www.instagram.com/pyramid_hsa/")
    }
    
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string)!, options: [:], completionHandler: nil)
    }
    
}
