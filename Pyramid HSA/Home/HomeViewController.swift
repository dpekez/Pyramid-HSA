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
    @IBOutlet weak var countdownCircle: CountdownCircleView!
    private var timer = Timer()
    private let countdown = Countdown()
    
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
        
        if countdown.eventIsCommingUp() {
            runTimer()
        } else {
            countdownUpdate()
        }
    }
    
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string) ?? URL(string: "https://www.duck.com")!, options: [:], completionHandler: nil)
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.countdownUpdate)), userInfo: nil, repeats: true)
    }
    
    @objc private func countdownUpdate() {
        if !countdown.eventIsCommingUp() {
            timer.invalidate()
            countdownCircle.removeFromSuperview()
        } else {
            countdownCircle.updateProgress()
        }
    }
}
