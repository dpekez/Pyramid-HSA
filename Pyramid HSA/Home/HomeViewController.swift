//
//  MapViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var countDownCircleView: CountdownCircleView!
    
    @IBAction func partnerViewUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownCircleView.create()
    }
}
