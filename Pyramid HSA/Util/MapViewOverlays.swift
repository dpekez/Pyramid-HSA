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
        createOverlay()
    }
    
    func moveCamera(to loc: CLLocationCoordinate2D, atDistance dist: CLLocationDistance, _ pitch: CGFloat = 0, _ heading: CLLocationDirection = 0) {
        let mapCam = MKMapCamera(lookingAtCenter: loc, fromDistance: dist, pitch: pitch, heading: heading)
        setCamera(mapCam, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolygon {
            let polygonRenderer = MKPolygonRenderer(overlay: overlay)
            polygonRenderer.fillColor = UIColor.pyramidBrighterBlue.withAlphaComponent(0.3)
            polygonRenderer.strokeColor = .pyramidDarkBlue
            polygonRenderer.lineWidth = 1
            
            return polygonRenderer
            
        } else if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = .pyramidDarkBlue
            polylineRenderer.lineWidth = 2
            
            return polylineRenderer
        }
        
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }
        
//        var annotationView: MKAnnotationView?
        
        return nil
    }
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        
//    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let rightButton = UIButton(type: .detailDisclosure)
        view.rightCalloutAccessoryView = rightButton
    }
    
    func createPointAnnotation() {
        let annotationL = MKPointAnnotation()
        let annotationK = MKPointAnnotation()
        let annotationM = MKPointAnnotation()
        let annotationW = MKPointAnnotation()
        let annotationTentA = MKPointAnnotation()
        let annotationTentB = MKPointAnnotation()
        
        annotationL.coordinate = CLLocationCoordinate2D(latitude: 48.358908, longitude: 10.905958)
        annotationK.coordinate = CLLocationCoordinate2D(latitude: 48.358967, longitude: 10.906961)
        annotationM.coordinate = CLLocationCoordinate2D(latitude: 48.358564, longitude: 10.906355)
        annotationW.coordinate = CLLocationCoordinate2D(latitude: 48.358496, longitude: 10.907053)
        annotationTentA.coordinate = CLLocationCoordinate2D(latitude: 48.358602, longitude: 10.905878)
        annotationTentB.coordinate = CLLocationCoordinate2D(latitude: 48.358860, longitude: 10.906377)
        
        annotationL.title = "L-Bau"
        annotationK.title = "K-Bau"
        annotationM.title = "M-Bau"
        annotationW.title = "W-Bau"
        annotationTentA.title = "Zelt A"
        annotationTentB.title = "Zelt B"
        
        addAnnotation(annotationL)
        addAnnotation(annotationK)
        addAnnotation(annotationM)
        addAnnotation(annotationW)
        addAnnotation(annotationTentA)
        addAnnotation(annotationTentB)
    }
    
    func createRegistrationPointAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 48.35867, longitude: 10.90793)
        annotation.title = "Anmeldepunkt"
        addAnnotation(annotation)
    }
    
    func createParkingAnnotation() {
        let annotation = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 48.352311, longitude: 10.906202)
        annotation.title = "Parkplatz"
        annotation.subtitle = "Frischstraße"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 48.355245, longitude: 10.914821)
        annotation2.title = "Parkplatz"
        annotation2.subtitle = "Spickelbad"
        addAnnotation(annotation)
        addAnnotation(annotation2)
    }
    
    func createPublicTransportAnnotation() {
        let annotation = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 48.358190, longitude: 10.902142)
        annotation.title = "Tramlinien 2 und 3"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 48.355013, longitude: 10.901830)
        annotation2.title = "Bahnhof"
        addAnnotation(annotation)
        addAnnotation(annotation2)
    }
    
    private func createOverlay() {
        let coordinatesL = [
            CLLocationCoordinate2D(latitude: 48.35875, longitude: 10.90542),
            CLLocationCoordinate2D(latitude: 48.35923, longitude: 10.90647),
            CLLocationCoordinate2D(latitude: 48.35922, longitude: 10.90648),
            CLLocationCoordinate2D(latitude: 48.35923, longitude: 10.90650),
            CLLocationCoordinate2D(latitude: 48.35919, longitude: 10.90655),
            CLLocationCoordinate2D(latitude: 48.35916, longitude: 10.90650),
            CLLocationCoordinate2D(latitude: 48.35912, longitude: 10.90653),
            CLLocationCoordinate2D(latitude: 48.35866, longitude: 10.90552)
        ]
        
        let coordinatesK = [
            CLLocationCoordinate2D(latitude: 48.35923, longitude: 10.90650),
            CLLocationCoordinate2D(latitude: 48.35928, longitude: 10.90659),
            CLLocationCoordinate2D(latitude: 48.35906, longitude: 10.90688),
            CLLocationCoordinate2D(latitude: 48.35894, longitude: 10.90714),
            CLLocationCoordinate2D(latitude: 48.35888, longitude: 10.90703),
            CLLocationCoordinate2D(latitude: 48.35901, longitude: 10.90677)
        ]
        
        let coordinatesM = [
            CLLocationCoordinate2D(latitude: 48.35833, longitude: 10.90582),
            CLLocationCoordinate2D(latitude: 48.35893, longitude: 10.90685),
            CLLocationCoordinate2D(latitude: 48.35890, longitude: 10.90690),
            CLLocationCoordinate2D(latitude: 48.35892, longitude: 10.90695),
            CLLocationCoordinate2D(latitude: 48.35888, longitude: 10.90703),
            CLLocationCoordinate2D(latitude: 48.35884, longitude: 10.90696),
            CLLocationCoordinate2D(latitude: 48.35878, longitude: 10.90705),
            CLLocationCoordinate2D(latitude: 48.35849, longitude: 10.90656),
            CLLocationCoordinate2D(latitude: 48.35856, longitude: 10.90647),
            CLLocationCoordinate2D(latitude: 48.35841, longitude: 10.90621),
            CLLocationCoordinate2D(latitude: 48.35838, longitude: 10.90625),
            CLLocationCoordinate2D(latitude: 48.35825, longitude: 10.90604),
            CLLocationCoordinate2D(latitude: 48.35828, longitude: 10.90599),
            CLLocationCoordinate2D(latitude: 48.35825, longitude: 10.90593)
        ]
        
        let coordinatesW = [
            CLLocationCoordinate2D(latitude: 48.35844, longitude: 10.90664),
            CLLocationCoordinate2D(latitude: 48.35881, longitude: 10.90727),
            CLLocationCoordinate2D(latitude: 48.35861, longitude: 10.90754),
            CLLocationCoordinate2D(latitude: 48.35824, longitude: 10.90690)
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
        
        let polygonL = MKPolygon(coordinates: coordinatesL, count: coordinatesL.count)
        let polygonK = MKPolygon(coordinates: coordinatesK, count: coordinatesK.count)
        let polygonM = MKPolygon(coordinates: coordinatesM, count: coordinatesM.count)
        let polygonW = MKPolygon(coordinates: coordinatesW, count: coordinatesW.count)
        let polygonTentA = MKPolygon(coordinates: coordinatesTentA, count: coordinatesTentA.count)
        let polygonTentB = MKPolygon(coordinates: coordinatesTentB, count: coordinatesTentB.count)
        
        addOverlay(polygonL)
        addOverlay(polygonK)
        addOverlay(polygonM)
        addOverlay(polygonW)
        addOverlay(polygonTentA)
        addOverlay(polygonTentB)
    }
    
}
