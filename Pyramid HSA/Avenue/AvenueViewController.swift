//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 20.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class AvenueViewController: UIViewController {
    @IBOutlet weak var mapView: MapViewOverlays!
    @IBAction func centerMapButton(_ sender: UIButton) {
        setMapCamera()
    }
    
    @IBAction func navButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func buildingButton(_ sender: UIButton) {
    }
    
    @IBAction func tentButton(_ sender: UIButton) {
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapCamera()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    private func setMapCamera() {
        let location = CLLocationCoordinate2D(latitude: 48.3578, longitude: 10.9059)
        let distance = CLLocationDistance(1050)
        let pitch = CGFloat(0)
        let heading = CLLocationDirection(0)
        
        let mapCam = MKMapCamera(lookingAtCenter: location, fromDistance: distance, pitch: pitch, heading: heading)
        
        mapView.setCamera(mapCam, animated: true)
    }
}

extension AvenueViewController {
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
