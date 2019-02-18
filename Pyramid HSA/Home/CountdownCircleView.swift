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
    private var countdownTime = Int()
    private let circleHeadings = ["days", "hours", "minutes", "seconds"]
    
    func create() {
        for i in 0...3 {
            let circlePath = createCircularPath(withXOffset: 40 + xOffset * i)
            let circleBackgroundShape = createShapeLayer(withPath: circlePath, color: PyramidColor.customGrey)
            let circleForegroundShape = createShapeLayer(withPath: circlePath, color: PyramidColor.pyramidBrightBlue.cgColor, strokeEnd: 0.75)
            
            layer.addSublayer(circleBackgroundShape)
            layer.addSublayer(circleForegroundShape)
            
            
            setHeaderLabel(withText: circleHeadings[i], atXPos: xOffset * i)
        }
        
        setCountLabel(label: &daysLabel, atXPos: 0, withInitialCount: countdownTime / 86400)
        setCountLabel(label: &hoursLabel, atXPos: xOffset, withInitialCount: countdownTime / 3600 % 24)
        setCountLabel(label: &minutesLabel, atXPos: xOffset * 2, withInitialCount: countdownTime / 60 % 60)
        setCountLabel(label: &secondsLabel, atXPos: xOffset * 3, withInitialCount: countdownTime % 60)
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
        
        if key != "" {
            addShapeLayerAnimation(forKey: key)
        }
        
        return shapeLayer
    }
    
    private func addShapeLayerAnimation(forKey key: String) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        var fromValue = 1
        
//        if key == "seconds" {
//            fromValue = Double((countdownTime % 60) / 60)
//        } else if key == "minutes" {
//            fromValue = Double((countdownTime / 60 % 60) / 60)
//        } else if key == "hours" {
//            fromValue = Double((countdownTime / 3600 % 24) / 60)
//        } else {
//            fromValue = Double((countdownTime / 86400) / 365)
//        }
        
        animation.fromValue = fromValue
        animation.toValue = 0
        animation.duration = CFTimeInterval(countdownTime % 60)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false

        self.shapeLayer.add(animation, forKey: key)
    }
    
    private func setCountLabel(label: inout UILabel, atXPos xPos: Int, withInitialCount count: Int) {
        label = UILabel(frame: CGRect(x: xPos, y: yPosCenter, width: 80, height: 18))
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.textColor = PyramidColor.pyramidMidBlue
        label.textAlignment = .center
        label.text = String(count)
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
    
    
    func initCountdown(seconds: Int) {
        countdownTime = seconds
        runTimer()
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(CountdownCircleView.updateLabels)), userInfo: nil, repeats: true)
    }

    @objc private func updateLabels() {
        countdownTime = Countdown().getTimeDiff()
        secondsLabel.text = "\(countdownTime % 60)"
        
        if countdownTime < 0 {
            timer.invalidate()
        }
        
        if countdownTime % 60 == 59 {
            addShapeLayerAnimation(forKey: "seconds")
        }
        
        if (countdownTime + 1) % 60 == 0 {
            minutesLabel.text = "\(countdownTime / 60 % 60)"
        }
        
        if (countdownTime / 60 + 1) % 60 == 0 {
            hoursLabel.text = "\(countdownTime / 3600 % 24)"
        }
        
        if (countdownTime / 3600 + 1) % 24 == 0 {
            daysLabel.text = "\(countdownTime / 86400)"
        }
    }

}