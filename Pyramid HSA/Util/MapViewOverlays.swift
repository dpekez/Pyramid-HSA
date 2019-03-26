//
//  MapViewOverlays.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 26.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit

class MapViewOverlays: MKMapView, MKMapViewDelegate {

    override func awakeFromNib() {
        delegate = self
        setUpMap()
        createPointAnnotation()
        createOverlay()
    }
    
    private func setUpMap() {
        let location = CLLocationCoordinate2D(latitude: 48.3588, longitude: 10.9065)
        let distance = CLLocationDistance(290)
        let pitch = CGFloat(0)
        let heading = CLLocationDirection(0)
        
        let mapCam = MKMapCamera(lookingAtCenter: location, fromDistance: distance, pitch: pitch, heading: heading)
        
        setCamera(mapCam, animated: false)
    }

    func createPointAnnotation() {
        let annotationM = MKPointAnnotation()
        let annotationL = MKPointAnnotation()
        let annotationTentA = MKPointAnnotation()
        let annotationTentB = MKPointAnnotation()
        let annotationW = MKPointAnnotation()
        
        annotationM.coordinate = CLLocationCoordinate2D(latitude: 48.358564, longitude: 10.906355)
        annotationL.coordinate = CLLocationCoordinate2D(latitude: 48.358908, longitude: 10.905958)
        annotationTentA.coordinate = CLLocationCoordinate2D(latitude: 48.358602, longitude: 10.905878)
        annotationTentB.coordinate = CLLocationCoordinate2D(latitude: 48.358860, longitude: 10.906377)
        annotationW.coordinate = CLLocationCoordinate2D(latitude: 48.358496, longitude: 10.907053)
        
        addAnnotation(annotationM)
        addAnnotation(annotationL)
        addAnnotation(annotationTentA)
        addAnnotation(annotationTentB)
        addAnnotation(annotationW)
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
        
        addOverlay(polygonLM)
        addOverlay(polygonW)
        addOverlay(polygonTentA)
        addOverlay(polygonTentB)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polygonRenderer = MKPolygonRenderer(overlay: overlay)
        polygonRenderer.fillColor = PyramidColor.pyramidBrighterBlue.withAlphaComponent(0.3)
        polygonRenderer.strokeColor = PyramidColor.pyramidDarkBlue
        polygonRenderer.lineWidth = 2
        
        return polygonRenderer
    }
    
}
