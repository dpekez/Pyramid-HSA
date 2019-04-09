//
//  MapAnnotations.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 07.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import Foundation
import MapKit

class BuildingAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var kind: FloorName

    init(kind: FloorName ,title: String, subtitle: String? = nil, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.kind = kind
    }
    
}

class AvenueAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String? = nil, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.title = title
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.subtitle = subtitle
    }
    
}
