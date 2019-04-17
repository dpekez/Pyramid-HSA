//
//  CircularGraph.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 21.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class CircularGraph: Graph {
    
    private let radiusOffset: CGFloat = 20
    private let radiusStep: CGFloat = 20
    private let barWidth: CGFloat = 8
    private let strokeStart: CGFloat = 0
    private let animationDuration: CFTimeInterval = 1
    private let barBackgroundColor = UIColor.customGrey.cgColor
    private var interestRatings = [PyramidFaculty: CGFloat]()
    private let interest: [PyramidFaculty] = [
        .architecture, .electricalEngineering, .design, .computerScience, .mechanicalEngineering, .businessAdministration
    ]
    private let colors: [UIColor] = [
        .architecture, .electricalEngineering, .design, .computerScience, .mechanicalEngineering, .businessAdministration
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setInterestRatings(interest: Dictionary<PyramidFaculty, Int>) {
        for (key, value) in interest {
            switch value {
            case 0: interestRatings[key] = 0
            case 1: interestRatings[key] = 0.2
            case 2: interestRatings[key] = 0.4
            case 3: interestRatings[key] = 0.6
            case 4: interestRatings[key] = 0.8
            case 5: interestRatings[key] = 1
            default: interestRatings[key] = 0
            }
        }
    }
    
    override func create() {
        var stepper = 0
        for i in interest {
            let yPos = radiusOffset + radiusStep * CGFloat(stepper)
            var color = colors[stepper].cgColor
            
            let circularPath = createCircularPath(withRadius: yPos)
            createShapeLayer(withPath: circularPath, color: color, strokeEnd: interestRatings[i]!, animated: true)
            createShapeLayer(withPath: circularPath, color: barBackgroundColor, strokeEnd: 1)
            
            if interestRatings[i] == 0 {
                color = barBackgroundColor
            }
            
            createTextLayer(withInterest: i.rawValue, color: color, yPos: yPos)
            
            stepper += 1
        }
    }
    
    private func createTextLayer(withInterest interest: String, color: CGColor, yPos: CGFloat) {
        let textLayer = CATextLayer()
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.foregroundColor = color
        textLayer.font = UIFont(name: "Avenir", size: 14.0)
        textLayer.fontSize = 14.0
        textLayer.string = interest
        textLayer.alignmentMode = CATextLayerAlignmentMode.right
        textLayer.frame = CGRect(x: 0, y: center.y - yPos - 11, width: self.frame.size.width / 2 - 10, height: 40.0)
        textLayer.contentsScale = UIScreen.main.scale
        
        layer.addSublayer(textLayer)
    }
    
    private func createCircularPath(withRadius radius: CGFloat) -> CGPath {
        return UIBezierPath.init(
            arcCenter: center,
            radius: radius,
            startAngle: 3 * .pi / 2,
            endAngle: .pi,
            clockwise: true
            ).cgPath
    }
    
    private func createShapeLayer(withPath path: CGPath, color: CGColor, strokeEnd: CGFloat, animated: Bool = false) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.strokeStart = strokeStart
        shapeLayer.strokeEnd = strokeEnd
        shapeLayer.lineWidth = barWidth
        shapeLayer.lineCap = .round
        
        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = strokeStart
            animation.toValue = strokeEnd
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.duration = animationDuration
            shapeLayer.add(animation, forKey: nil)
        }
        
        layer.addSublayer(shapeLayer)
    }
    
}
