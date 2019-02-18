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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countDownCircleView.initCountdown(seconds: Countdown().getTimeDiff())
        countDownCircleView.create()
        
    }
}
