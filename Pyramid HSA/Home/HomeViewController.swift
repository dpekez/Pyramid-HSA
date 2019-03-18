//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var countDownCircleView: CountdownCircleView!
    
    @IBAction func pyramidHeader(_ sender: Any) {
        openURL(string: "https://www.pyramid-hsa.de")
    }
    @IBAction func hsaIcon(_ sender: Any) {
        openURL(string: "https://www.hs-augsburg.de")
    }
    
    @IBAction func fbIcon(_ sender: Any) {
        openURL(string: "https://www.facebook.com/Firmenkontaktmesse.Pyramid/")
    }
    
    @IBAction func igIcon(_ sender: Any) {
        openURL(string: "https://www.instagram.com/pyramid_hsa/")
    }
    
    @IBAction func partnerViewUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var partnerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownCircleView.create()
        partnerButton.setTitle("Unsere\nPartner", for: .normal)
    }
    
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string)!, options: [:], completionHandler: nil)
    }
}
