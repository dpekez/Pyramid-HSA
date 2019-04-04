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
    private var timer = Timer()
    private let countdown = Countdown()
    @IBOutlet weak var mapView: MapViewOverlays!
    @IBOutlet weak var countdownCircle: CountdownCircleView!
    @IBOutlet weak var partnerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        partnerButton.setTitle("Unsere\nPartner", for: .normal)
        
        if countdown.eventIsCommingUp() {
            runTimer()
        } else {
            countdownUpdate()
        }
        mapView.createPointAnnotation()
        setMapCamera()
    }
    
    private func setMapCamera() {
        let loc = CLLocationCoordinate2D(latitude: 48.3588, longitude: 10.9065)
        let dist = CLLocationDistance(290)
        mapView.moveCamera(to: loc, atDistance: dist)
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
    
    @IBAction func mapCenterButton(_ sender: UIButton) {
        setMapCamera()
    }
    
    @IBAction func pyramidHeader(_ sender: Any) {
        openURL(string: "https://www.pyramid-hsa.de")
    }
    @IBAction func hsaIcon(_ sender: Any) {
        openURL(string: "https://www.hs-augsburg.de")
    }
    
    @IBAction func partnerViewUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
}

extension HomeViewController {
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string)!, options: [:])
    }
}
