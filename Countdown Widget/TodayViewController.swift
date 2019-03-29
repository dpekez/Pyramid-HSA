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
    @IBOutlet weak var circles: CountdownCircleView!
    let countdown = Countdown()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if countdown.eventIsCommingUp() {
            runTimer()
        } else {
            setLabel()
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @objc private func setLabel() {
        if countdown.eventIsCommingUp() {
            circles.updateProgress()
        } else if countdown.eventIsLive() {
            labelor(string: "Viel Spaß bei der Pyramid \(countdown.eventYear)!")
        } else {
            labelor(string: "Bis zum nächsten Mal!")
        }
    }
    
    private func labelor(string: String) {
        timer.invalidate()
        circles.removeFromSuperview()
        countDownLabel.isHidden = false
        countDownLabel.text = string
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.setLabel)), userInfo: nil, repeats: true)
    }
    
}
