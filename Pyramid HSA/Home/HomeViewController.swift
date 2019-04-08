//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate {
    private var timer = Timer()
    private let countdown = Countdown()
    private var floorMap = FloorName.mMain
    @IBOutlet weak var mapView: MapViewOverlays!
    @IBOutlet weak var countdownCircle: CountdownCircleView!
    @IBOutlet weak var partnerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        partnerButton.setTitle("Unsere\nPartner", for: .normal)
        
        if countdown.eventIsCommingUp() {
            runTimer()
        } else {
            countdownUpdate()
        }
        
        createBuildingAnnotations()
        setMapCamera()
    }
    
    
    
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let identifier = "building"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let buildingAnnotation = view.annotation as! BuildingAnnotation
        
        floorMap = buildingAnnotation.kind
        performSegue(withIdentifier: "floorDetailSegue", sender: self)
    }
    
    private func createBuildingAnnotations() {
        mapView.addAnnotation(BuildingAnnotation(kind: .lMain, title: "L-Bau", latitude: 48.358908, longitude: 10.905958))
        mapView.addAnnotation(BuildingAnnotation(kind: .mMain, title: "K-Bau", latitude: 48.358967, longitude: 10.906961))
        mapView.addAnnotation(BuildingAnnotation(kind: .mMain, title: "M-Bau", latitude: 48.358564, longitude: 10.906355))
        mapView.addAnnotation(BuildingAnnotation(kind: .wMain, title: "W-Bau", latitude: 48.358496, longitude: 10.907053))
        mapView.addAnnotation(BuildingAnnotation(kind: .tentA, title: "Zelt A", latitude: 48.358602, longitude: 10.905878))
        mapView.addAnnotation(BuildingAnnotation(kind: .tentB, title: "Zelt B", latitude: 48.358860, longitude: 10.906377))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "floorDetailSegue" {
            let floorsVC = (segue.destination as! UINavigationController).topViewController as! FloorsAllViewController
            floorsVC.floor = floorMap
        }
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
