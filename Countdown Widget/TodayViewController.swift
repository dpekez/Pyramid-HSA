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
            countDownLabel.text = "\(countdown.getDayDiff()) Days, \(countdown.getHourDiff()) Hours, \(countdown.getMinuteDiff()) Minutes"
        } else if countdown.eventIsLive() {
            countDownLabel.text = "Have fun at Pyramid \(countdown.eventYear)!"
        } else {
            countDownLabel.text = "See you next time!"
        }
    }
    
}


// var timer = Timer()
//
// func updateInfo() {
//    strTimer.text = Date().description
// }
//
// override func viewDidLoad() {
//    super.viewDidLoad()
//    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateInfo), userInfo: nil, repeats: true)
//    RunLoop.main.add(timer, forMode: .commonModes)
// }
//
// func widgetPerformUpdate(completionHandler: @escaping (NCUpdateResult) -> Void) {
//    completionHandler(.newData)
// }
