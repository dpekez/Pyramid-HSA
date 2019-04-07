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

        let floor = roomParser.getFloor(string: room)
        
        self.title = getNameOfBuilding(forFloor: floor)
        
        imageView.image = UIImage(named: floor.rawValue)
    }
    
    private func getNameOfBuilding(forFloor floor: Floor) -> String {
        switch floor {
        case .tentA:
            return Building.tentA.rawValue
        case .tentB:
            return Building.tentB.rawValue
        case .wMain:
            return Building.wMain.rawValue
        case .wSecond:
            return Building.wSecond.rawValue
        case .mMain:
            return Building.mMain.rawValue
        case .mSecond:
            return Building.mSecond.rawValue
        case .lMain:
            return Building.lMain.rawValue
        }
    }
    
}

enum Floor: String {
    
    case tentA = "tentA"
    case tentB = "tentB"
    case wMain = "wMainFloor"
    case wSecond = "wSecondFloor"
    case mMain = "mMainFloor"
    case mSecond = "mSecondFloor"
    case lMain = "lMainFloor"
    
}

enum Building: String {
    
    case tentA = "Zelt A"
    case tentB = "Zelt B"
    case wMain = "W-Bau EG"
    case wSecond = "W-Bau 2. OG"
    case mMain = "M-Bau EG"
    case mSecond = "M-Bau 1. OG"
    case lMain = "L-Bau EG"
    
}
