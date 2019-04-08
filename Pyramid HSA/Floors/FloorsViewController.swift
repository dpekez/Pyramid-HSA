//
//  FloorsViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 07.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class FloorsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var room = String()
    var stand = String()
    let roomParser = RoomParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let floorName = roomParser.getFloorName(string: room)
        
        self.title = floorName.rawValue + ", Stand: " + stand
        
        let floorImage = getFloorImage(forFloor: floorName)
        
        imageView.image = UIImage(named: floorImage)
    }
    
    private func getFloorImage(forFloor floor: FloorName) -> String {
        switch floor {
        case .tentA:
            return "tentA"
        case .tentB:
            return "tentB"
        case .wMain:
            return "wMainFloor"
        case .wSecond:
            return "wSecondFloor"
        case .mMain:
            return "mMainFloor"
        case .mSecond:
            return "mSecondFloor"
        case .lMain:
            return "lMainFloor"
        }
    }
    
}
