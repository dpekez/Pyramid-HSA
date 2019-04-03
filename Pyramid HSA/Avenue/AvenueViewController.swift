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
    let gMaps = "https://goo.gl/maps/bda4HnWPQ5G2"
    let aMaps = "https://maps.apple.com/?q=48.358685,10.907935&sll=48.358685,10.907935&sspn=0.001922,0.003246&t=m"
    
    @IBAction func navButton(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: nil, message: "Zur Firmenregistrierung navigieren", preferredStyle: .actionSheet)
        
        // make sure this works on iPad too
        if let actionSheet = actionSheet.popoverPresentationController {
            actionSheet.barButtonItem = sender
        }
        
        let gMapsAction = UIAlertAction(title: "In Google Maps öffnen", style: .default, handler: {_ in self.openURL(string: self.gMaps)})
        let aMapsAction = UIAlertAction(title: "In Apple Maps öffnen", style: .default, handler: {_ in self.openURL(string: self.aMaps)})
        actionSheet.addAction(gMapsAction)
        actionSheet.addAction(aMapsAction)
        actionSheet.addAction(UIAlertAction(title: "Abbrechen", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    @IBAction func buildingButton(_ sender: UIButton) {
    }
    
    @IBAction func tentButton(_ sender: UIButton) {
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapCamera()
        mapView.createRegistrationPointAnnotation()
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

extension AvenueViewController {
    private func openURL(string: String) {
        let link = URL(string: string)
        if link != nil {
            UIApplication.shared.open(link!, options: [:])
        } else {
            showURLFailAlert()
        }
    }
}

extension AvenueViewController {
    private func showURLFailAlert() {
        let alert = UIAlertController(title: "Hoppla!", message: "Leider ist der Link nicht gültig.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
