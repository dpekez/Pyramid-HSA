//
//  FloorsAllViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 08.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class FloorsAllViewController: UIViewController {
    @IBOutlet weak var floorsSC: UISegmentedControl!
    @IBOutlet weak var image: UIImageView!
    var floor = FloorName.lMain
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floorsSC.removeAllSegments()
        
        createSegmentControl()
        
        setImage()
    }
    
    private func createSegmentControl() {
        
        floorsSC.insertSegment(withTitle: floor.rawValue, at: 0, animated: false)
        floorsSC.selectedSegmentIndex = 0
        
        switch floor {
        case .wMain:
            floorsSC.insertSegment(withTitle: FloorName.wSecond.rawValue, at: 1, animated: false)
        case .mMain:
            floorsSC.insertSegment(withTitle: FloorName.mSecond.rawValue, at: 1, animated: false)
        default:
            break
        }
        
    }
    
    @IBAction func floorSCValueChanged(_ sender: UISegmentedControl) {
        setImage()
    }
    
    private func setImage() {
        switch floor {
        case .wMain,
             .wSecond:
            if floorsSC.selectedSegmentIndex == 0 {
                image.image = UIImage(named: "wMainFloor")
            } else {
                image.image = UIImage(named: "wSecondFloor")
            }
        case .mMain,
             .mSecond:
            if floorsSC.selectedSegmentIndex == 0 {
                image.image = UIImage(named: "mMainFloor")
            } else {
                image.image = UIImage(named: "mSecondFloor")
            }
        case .tentA:
            image.image = UIImage(named: "tentA")
        case .tentB:
            image.image = UIImage(named: "tentB")
        case .lMain:
            image.image = UIImage(named: "lMainFloor")
        }
    }
    
}
