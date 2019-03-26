//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 20.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class AvenueViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    
    @IBAction func navButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func buildingButton(_ sender: UIButton) {
    }
    
    @IBAction func tentButton(_ sender: UIButton) {
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        setUpMap()
        createOverlay()
        createTentWaypoint()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func setUpMap() {
        let location = CLLocationCoordinate2D(latitude: 48.3578, longitude: 10.9059)
        let distance = CLLocationDistance(1050)
        let pitch = CGFloat(0)
        let heading = CLLocationDirection(0)
        
        let mapCam = MKMapCamera(lookingAtCenter: location, fromDistance: distance, pitch: pitch, heading: heading)
        
        map.setCamera(mapCam, animated: false)
    }
    
    func createTentWaypoint() {
        let coordinates = [
            CLLocationCoordinate2D(latitude: 48.35554, longitude: 10.90401),
            CLLocationCoordinate2D(latitude: 48.35664, longitude: 10.90633),
            CLLocationCoordinate2D(latitude: 48.35689, longitude: 10.90601),
            CLLocationCoordinate2D(latitude: 48.35752, longitude: 10.90442),
            CLLocationCoordinate2D(latitude: 48.35782, longitude: 10.90435),
            CLLocationCoordinate2D(latitude: 48.35785, longitude: 10.90506),
            CLLocationCoordinate2D(latitude: 48.35796, longitude: 10.9053),
            CLLocationCoordinate2D(latitude: 48.35832, longitude: 10.90531),
            CLLocationCoordinate2D(latitude: 48.35832, longitude: 10.90573)
        ]
        
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)

        map.addOverlay(polyline)
    }
    
    func createOverlay() {
        let coordinatesLM = [
            CLLocationCoordinate2D(latitude: 48.358757, longitude: 10.905410),
            CLLocationCoordinate2D(latitude: 48.359293, longitude: 10.906501),
            CLLocationCoordinate2D(latitude: 48.358878, longitude: 10.907143),
            CLLocationCoordinate2D(latitude: 48.358214, longitude: 10.905982),
            CLLocationCoordinate2D(latitude: 48.358347, longitude: 10.905852),
            CLLocationCoordinate2D(latitude: 48.358917, longitude: 10.906835),
            CLLocationCoordinate2D(latitude: 48.359144, longitude: 10.906567),
            CLLocationCoordinate2D(latitude: 48.358652, longitude: 10.905508)
        ]
        
        let coordinatesW = [
            CLLocationCoordinate2D(latitude: 48.358850, longitude: 10.907276),
            CLLocationCoordinate2D(latitude: 48.358623, longitude: 10.907593),
            CLLocationCoordinate2D(latitude: 48.358228, longitude: 10.906906),
            CLLocationCoordinate2D(latitude: 48.358460, longitude: 10.906607)
        ]
        
        let coordinatesTentA = [
            CLLocationCoordinate2D(latitude: 48.358593, longitude: 10.905575),
            CLLocationCoordinate2D(latitude: 48.358809, longitude: 10.906010),
            CLLocationCoordinate2D(latitude: 48.358640, longitude: 10.906221),
            CLLocationCoordinate2D(latitude: 48.358417, longitude: 10.905787)
        ]
        
        let coordinatesTentB = [
            CLLocationCoordinate2D(latitude: 48.358859, longitude: 10.906097),
            CLLocationCoordinate2D(latitude: 48.359075, longitude: 10.906527),
            CLLocationCoordinate2D(latitude: 48.358917, longitude: 10.906723),
            CLLocationCoordinate2D(latitude: 48.358676, longitude: 10.906307)
        ]
        
        let polygonLM = MKPolygon(coordinates: coordinatesLM, count: coordinatesLM.count)
        let polygonW = MKPolygon(coordinates: coordinatesW, count: coordinatesW.count)
        let polygonTentA = MKPolygon(coordinates: coordinatesTentA, count: coordinatesTentA.count)
        let polygonTentB = MKPolygon(coordinates: coordinatesTentB, count: coordinatesTentB.count)
        
        map.addOverlay(polygonLM)
        map.addOverlay(polygonW)
        map.addOverlay(polygonTentA)
        map.addOverlay(polygonTentB)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolygon {
            let polygonRenderer = MKPolygonRenderer(overlay: overlay)
            polygonRenderer.fillColor = PyramidColor.pyramidBrighterBlue.withAlphaComponent(0.3)
            polygonRenderer.strokeColor = PyramidColor.pyramidDarkBlue
            polygonRenderer.lineWidth = 2
            
            return polygonRenderer
            
        } else if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = PyramidColor.pyramidDarkBlue
            polylineRenderer.lineWidth = 4
            
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
