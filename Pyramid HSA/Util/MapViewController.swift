//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    var mapCam: MKMapCamera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMap()
    }
    
    private func setUpMap() {
        let location = CLLocationCoordinate2DMake(48.3586, 10.9063)
        let distance = CLLocationDistance(310)
        let pitch = CGFloat(55)
        let heading = CLLocationDirection(85)
        
        mapCam = MKMapCamera(lookingAtCenter: location, fromDistance: distance, pitch: pitch, heading: heading)
        
        map.setCamera(mapCam!, animated: false)
        map.isUserInteractionEnabled = false;
    }
}
