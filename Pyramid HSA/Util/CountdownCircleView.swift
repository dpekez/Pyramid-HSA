//
//  CountdownView.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 16.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class CountdownCircleView: UIView {
    private var xOffset = CGFloat()
    private var yCenter = CGFloat()
    private let barWidth: CGFloat = 4
    private let countdown = Countdown()
    private var secondsLabel = UILabel()
    private var minutesLabel = UILabel()
    private var hoursLabel = UILabel()
    private var daysLabel = UILabel()
    private var secondsShapeLayer = CAShapeLayer()
    private var minutesShapeLayer = CAShapeLayer()
    private var hoursShapeLayer = CAShapeLayer()
    private var daysShapeLayer = CAShapeLayer()
    
    private var secondsProgress: Int = -1 {
        willSet(newValue) {
            secondsShapeLayer.strokeEnd = CGFloat(newValue) / 60.0
            secondsLabel.text = "\(newValue)"
        }
    }
    
    private var minutesProgress: Int = -1 {
        willSet(newValue) {
            if newValue != minutesProgress {
                minutesShapeLayer.strokeEnd = CGFloat(newValue) / 60.0
                minutesLabel.text = "\(newValue)"
            }
        }
    }
    
    private var hoursProgress: Int = -1 {
        willSet(newValue) {
            if newValue != hoursProgress {
                hoursShapeLayer.strokeEnd = CGFloat(newValue) / 24.0
                hoursLabel.text = "\(newValue)"
            }
        }
    }
    
    private var daysProgress: Int = -1 {
        willSet(newValue) {
            if newValue != daysProgress {
                daysShapeLayer.strokeEnd = CGFloat(newValue) / 365.0
                daysLabel.text = "\(newValue)"
            }
        }
    }
    
    private enum TimeUnit: String {
        case seconds = "Sekunden"
        case minutes = "Minuten"
        case hours = "Stunden"
        case days = "Tage"
    }
    
    private let timeUnits: [TimeUnit] = [.days, .hours, .minutes, .seconds]
    
    override func awakeFromNib() {
        xOffset = bounds.width / 4
        yCenter = bounds.height / 2
        if countdown.eventIsCommingUp() {
            create()
        }
    }
    
    func updateProgress() {
        secondsProgress = countdown.getSecondsDiff()
        minutesProgress = countdown.getMinutesDiff()
        hoursProgress = countdown.getHoursDiff()
        daysProgress = countdown.getDaysDiff()
    }
    
    private func create() {
        var circlePaths: [CGPath] = []
        for i in 0...3 {
            let runner = CGFloat(i)
            let circlePath = createCircularPath(withXOffset: xOffset/2 + xOffset * runner)
            circlePaths.append(circlePath)
            let circleBackgroundShape = createShapeLayer(withPath: circlePath)
            layer.addSublayer(circleBackgroundShape)
            setHeaderLabel(withText: timeUnits[i].rawValue, atXPos: xOffset * runner)
        }
        setShapeLayer(withPath: circlePaths[0], forShape: &daysShapeLayer)
        setShapeLayer(withPath: circlePaths[1], forShape: &hoursShapeLayer)
        setShapeLayer(withPath: circlePaths[2], forShape: &minutesShapeLayer)
        setShapeLayer(withPath: circlePaths[3], forShape: &secondsShapeLayer)
        layer.addSublayer(secondsShapeLayer)
        layer.addSublayer(minutesShapeLayer)
        layer.addSublayer(hoursShapeLayer)
        layer.addSublayer(daysShapeLayer)
        setCountLabel(label: &daysLabel, atXPos: 0)
        setCountLabel(label: &hoursLabel, atXPos: xOffset)
        setCountLabel(label: &minutesLabel, atXPos: xOffset * 2)
        setCountLabel(label: &secondsLabel, atXPos: xOffset * 3)
        updateProgress()
    }
    
    private func createCircularPath(withXOffset offset: CGFloat) -> CGPath {
        return UIBezierPath.init(
            arcCenter: CGPoint(x: offset, y: yCenter),
            radius: yCenter - barWidth / 2,
            startAngle: .pi * 1.25,
            endAngle: .pi * 1.75,
            clockwise: false
            ).cgPath
    }
    
    private func createShapeLayer(withPath path: CGPath) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.customGrey.cgColor
        shape.lineWidth = barWidth
        shape.lineCap = .round
        return shape
    }
    
    private func setShapeLayer(withPath path: CGPath, forShape shape: inout CAShapeLayer) {
        shape.path = path
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.pyramidBlue.cgColor
        shape.lineWidth = barWidth
        shape.lineCap = .round
    }
    
    private func setCountLabel(label: inout UILabel, atXPos xPos: CGFloat) {
        label = UILabel(frame: CGRect(x: xPos, y: yCenter, width: xOffset, height: 18))
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.textColor = .pyramidMidBlue
        label.textAlignment = .center
        addSubview(label)
    }
    
    private func setHeaderLabel(withText text: String, atXPos xPos: CGFloat) {
        let label = UILabel(frame: CGRect(x: xPos, y: 0, width: xOffset, height: 18))
        label.font = UIFont(name: label.font.fontName, size: 9)
        label.textColor = .pyramidDarkBlue
        label.textAlignment = .center
        label.text = text
        addSubview(label)
    }
}
