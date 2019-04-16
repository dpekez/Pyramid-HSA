//
//  Graph.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 12.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

protocol GraphProtocol {
    func create()
    func setInterestRatings(interest: Dictionary<PyramidFaculty, Int>)
}

class Graph: UIView, GraphProtocol {
    func create() {
    }
    
    func setInterestRatings(interest: Dictionary<PyramidFaculty, Int>) {
    }
    
}
