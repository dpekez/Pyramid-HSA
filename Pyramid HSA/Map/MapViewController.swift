//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 20.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    var mapCam: MKMapCamera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        setUpMap()
        createPlacemark()
        createOverlay()
    }
    
    private func setUpMap() {
        let location = CLLocationCoordinate2DMake(48.3586, 10.9063)
        let distance = CLLocationDistance(310)
        let pitch = CGFloat(0)
        let heading = CLLocationDirection(85)
        
        mapCam = MKMapCamera(lookingAtCenter: location, fromDistance: distance, pitch: pitch, heading: heading)
        
        map.setCamera(mapCam!, animated: false)
//        map.isUserInteractionEnabled = false;
    }
    
    func createPlacemark() {
        
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
        let polygonRenderer = MKPolygonRenderer(overlay: overlay)
        polygonRenderer.fillColor = PyramidColor.pyramidBrighterBlue.withAlphaComponent(0.5)
        polygonRenderer.strokeColor = PyramidColor.pyramidDarkBlue
        polygonRenderer.lineWidth = 3
        
        return polygonRenderer
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
