//
//  CountdownView.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 16.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class CountdownCircleView: UIView {
    private let yPosCenter = 36
    private let xOffset = 80
    private let circleRadius: CGFloat = 36
    private let barWidth: CGFloat = 4
    private var shapeLayer = CAShapeLayer()
    private var daysLabel = UILabel()
    private var hoursLabel = UILabel()
    private var minutesLabel = UILabel()
    private var secondsLabel = UILabel()
    private var timer = Timer()
    private let circleHeadings = ["days", "hours", "minutes", "seconds"]
    private let countdown = Countdown()
    
    func create() {
        if countdown.eventIsCommingUp() {
            runTimer()
            
            for i in 0...3 {
                let circlePath = createCircularPath(withXOffset: 40 + xOffset * i)
                let circleBackgroundShape = createShapeLayer(withPath: circlePath, color: PyramidColor.customGrey)
                let circleForegroundShape = createShapeLayer(withPath: circlePath, color: PyramidColor.pyramidBrightBlue.cgColor, strokeEnd: calcStrokeLength(for: circleHeadings[i]), animationKey: circleHeadings[i])
                
                layer.addSublayer(circleBackgroundShape)
                layer.addSublayer(circleForegroundShape)
                
                setHeaderLabel(withText: circleHeadings[i], atXPos: xOffset * i)
            }
            
            setCountLabel(label: &daysLabel, atXPos: 0)
            setCountLabel(label: &hoursLabel, atXPos: xOffset)
            setCountLabel(label: &minutesLabel, atXPos: xOffset * 2)
            setCountLabel(label: &secondsLabel, atXPos: xOffset * 3)
        } else {
            self.isHidden = true
        }
    }
    
    private func calcStrokeLength(for string: String) -> CGFloat {
        switch string {
        case "days":
            return CGFloat(countdown.getDayDiff()) / 365.0
        case "hours":
            return CGFloat(countdown.getHourDiff()) / 24.0
        case "minutes":
            return CGFloat(countdown.getMinuteDiff()) / 60.0
        case "seconds":
            return CGFloat(countdown.getSecondDiff()) / 60.0
        default:
            return 1
        }
    }
    
    private func createCircularPath(withXOffset offset: Int) -> CGPath {
        return UIBezierPath.init(
            arcCenter: CGPoint(x: offset, y: yPosCenter),
            radius: circleRadius,
            startAngle: .pi * 1.25,
            endAngle: .pi * 1.75,
            clockwise: false
            ).cgPath
    }
    
    private func createShapeLayer(withPath path: CGPath, color: CGColor, strokeEnd: CGFloat = 1, animationKey key: String = "") -> CAShapeLayer {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.strokeEnd = strokeEnd
        shapeLayer.lineWidth = barWidth
        shapeLayer.lineCap = .round
        
        if key == "seconds" {
            addShapeLayerAnimation(forKey: key, duration: Float(countdown.getSecondDiff()))
        } else if key == "minutes" {
            addShapeLayerAnimation(forKey: key, duration: Float(countdown.getMinuteDiff()))
        } else if key == "hours" {
            addShapeLayerAnimation(forKey: key, duration: Float(countdown.getHourDiff()))
        }
        
        return shapeLayer
    }
    
    private func addShapeLayerAnimation(forKey key: String, duration: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        if key == "seconds" {
            animation.fromValue = duration / 60
            animation.duration = CFTimeInterval(duration)
        } else if key == "minutes" {
            animation.fromValue = duration / 60
            animation.duration = CFTimeInterval(duration * 60)
        } else if key == "hours" {
            animation.fromValue = duration / 24
            animation.duration = CFTimeInterval(duration * 60 * 24)
        }
        
        animation.toValue = 0
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false

        self.shapeLayer.add(animation, forKey: key)
    }
    
    private func setCountLabel(label: inout UILabel, atXPos xPos: Int) {
        label = UILabel(frame: CGRect(x: xPos, y: yPosCenter, width: 80, height: 18))
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.textColor = PyramidColor.pyramidMidBlue
        label.textAlignment = .center
        label.text = "0"
        addSubview(label)
    }
    
    private func setHeaderLabel(withText text: String, atXPos xPos: Int) {
        let label = UILabel(frame: CGRect(x: xPos, y: 0, width: 80, height: 18))
        label.font = UIFont(name: label.font.fontName, size: 10)
        label.textColor = PyramidColor.pyramidBlue
        label.textAlignment = .center
        label.text = text
        addSubview(label)
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(CountdownCircleView.updateLabels)), userInfo: nil, repeats: true)
    }

    @objc private func updateLabels() {
        if !countdown.eventIsCommingUp() {
            timer.invalidate()
            return
        }
        
        let secondsDiff = countdown.getSecondDiff()
        let minutesDiff = countdown.getMinuteDiff()
        let hoursDiff = countdown.getHourDiff()
        let daysDiff = countdown.getDayDiff()
        
        secondsLabel.text = "\(secondsDiff)"
        if secondsDiff == 59 {
            addShapeLayerAnimation(forKey: "seconds", duration: 60)
        }
        
        minutesLabel.text = "\(minutesDiff)"
        if minutesDiff == 59 {
            addShapeLayerAnimation(forKey: "minutes", duration: 60 * 60)
        }
        
        hoursLabel.text = "\(hoursDiff)"
        if hoursDiff == 23 {
            addShapeLayerAnimation(forKey: "hours", duration: 60 * 60 * 24)
        }
        
        daysLabel.text = "\(daysDiff)"
    }

}
