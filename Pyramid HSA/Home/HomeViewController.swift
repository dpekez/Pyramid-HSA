//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    @IBAction func pyramidHeader(_ sender: Any) {
        openURL(string: "https://www.pyramid-hsa.de")
    }
    @IBAction func hsaIcon(_ sender: Any) {
        openURL(string: "https://www.hs-augsburg.de")
    }
    
    @IBAction func partnerViewUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var partnerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partnerButton.setTitle("Unsere\nPartner", for: .normal)
    }
    
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string) ?? URL(string: "https://www.duck.com")!, options: [:], completionHandler: nil)
    }
}
