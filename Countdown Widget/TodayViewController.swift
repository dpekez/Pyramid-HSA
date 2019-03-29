//
//  TodayViewController.swift
//  Countdown Widget
//
//  Created by Dejan Pekez on 23.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var circles: UIView!
    let countdown = Countdown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    private func setLabel() {
        if countdown.eventIsCommingUp() {
            // nil
        } else if countdown.eventIsLive() {
            countDownLabel.isHidden = false
            circles.removeFromSuperview()
            countDownLabel.text = "Viel Spaß bei der Pyramid \(countdown.eventYear)!"
        } else {
            countDownLabel.isHidden = false
            circles.removeFromSuperview()
            countDownLabel.text = "Bis zum nächsten Mal!"
        }
    }
    
}
