//
//  PyramidColors.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 21.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

struct PyramidColor {
    static let customGrey = UIColor(white: 0.7, alpha: 0.3).cgColor
    
    // #C5C8E6
    static let pyramidBrighterBlue = UIColor(red:0.77, green:0.78, blue:0.90, alpha:1.0)
    
    // #9FA7D4
    static let pyramidBrightBlue = UIColor(red:0.62, green:0.65, blue:0.83, alpha:1.0)
    
    // #6F81BE
    static let pyramidMidBlue = UIColor(red:0.44, green:0.51, blue:0.75, alpha:1.0)
    
    // #566FB3
    static let pyramidDarkBlue = UIColor(red:0.34, green:0.44, blue:0.70, alpha:1.0)
    
    // #3D5FA8 (pyramidDarkerBlue)
    static let pyramidBlue = UIColor(red:0.24, green:0.37, blue:0.66, alpha:1.0)
    
    static let colorDict: [PyramidFaculty: UIColor] = [
        // #006532
        .architecture: UIColor(red:0.00, green:0.40, blue:0.20, alpha:1.0),
        // #82358B
        .businessAdministration: UIColor(red:0.51, green:0.21, blue:0.55, alpha:1.0),
        // #925F36
        .computerScience: UIColor(red:0.57, green:0.37, blue:0.21, alpha:1.0),
        // #F39200
        .design: UIColor(red:0.95, green:0.57, blue:0.00, alpha:1.0),
        // #E6332A
        .electricalEngineering: UIColor(red:0.90, green:0.20, blue:0.16, alpha:1.0),
        // #3362AC
        .mechanicalEngineering: UIColor(red:0.20, green:0.38, blue:0.67, alpha:1.0)
    ]
    
}
