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
    
    let locationManager = CLLocationManager()
    let gMaps = URL(string: "https://www.google.de/maps/place/Hochschule+Augsburg/@48.3589748,10.9063944,18z/data=!4m5!3m4!1s0x0:0x8a16b7655d3bfdc5!8m2!3d48.3583307!4d10.9058189")
    let aMaps = URL(string: "https://maps.apple.com/?q=48.359260,10.906433&sll=48.359260,10.906433&sspn=0.001197,0.002547&t=m")
    let gMapsRegistration = ""
    let aMapsRegistration = ""
    let nearDist = CLLocationDistance(700)
    
    @IBOutlet weak var mapView: MapViewOverlays!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapCamera()
        mapView.createRegistrationPointAnnotation()
        mapView.createParkingAnnotation()
        mapView.createPublicTransportAnnotation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    private func setMapCamera() {
        let loc = CLLocationCoordinate2D(latitude: 48.3559, longitude: 10.9080)
        let dist = CLLocationDistance(2500)
    
        mapView.moveCamera(to: loc, atDistance: dist)
    }
    
    @IBAction func centerMapButton(_ sender: UIButton) {
        setMapCamera()
    }
    
    @IBAction func navButton(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "Campus am Roten Tor", message: "Schülestraße 1, 86161 Augsburg", preferredStyle: .actionSheet)
        
        // make sure this works on iPad too
        if let actionSheet = actionSheet.popoverPresentationController {
            actionSheet.barButtonItem = sender
        }
        
        let gMapsAction = UIAlertAction(title: "In „Google Maps“ öffnen", style: .default, handler: {_ in
            UIApplication.shared.open(self.gMaps!, options: [:])})
        let aMapsAction = UIAlertAction(title: "In „Karten“ öffnen", style: .default, handler: {_ in
            UIApplication.shared.open(self.aMaps!, options: [:])})
        let copyAction = UIAlertAction(title: "Kopieren", style: .default, handler: {_ in
            UIPasteboard.general.string = "Schülestraße 1, 86161 Augsburg"
        })
        actionSheet.addAction(gMapsAction)
        actionSheet.addAction(aMapsAction)
        actionSheet.addAction(copyAction)
        actionSheet.addAction(UIAlertAction(title: "Abbrechen", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    @IBAction func tramSixTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.3588, longitude: 10.9065)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func bus32Tapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.3588, longitude: 10.9065)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func bus35Tapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.3588, longitude: 10.9065)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func tramTwoTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.358190, longitude: 10.902142)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func tramThreeTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.358190, longitude: 10.902142)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func trainTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.355013, longitude: 10.901830)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func parkingFrischTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.352311, longitude: 10.906202)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }
    
    @IBAction func parkingSpickelTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.355245, longitude: 10.914821)
        mapView.moveCamera(to: loc, atDistance: nearDist)
    }

    @IBAction func registrationTapped(_ sender: UITapGestureRecognizer) {
        let loc = CLLocationCoordinate2D(latitude: 48.35867, longitude: 10.90793)
        mapView.moveCamera(to: loc, atDistance: nearDist)
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
