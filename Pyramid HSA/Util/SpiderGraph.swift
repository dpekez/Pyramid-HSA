//
//  SpiderGraph.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 10.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class SpiderGraph: Graph {
    
    private var width = CGFloat()
    private var height = CGFloat()
    private var radiusOffset = CGFloat()
    private let barWidth: CGFloat = 1
    private var interestRatings = [PyramidFaculty: CGFloat]()
    private let interest: [PyramidFaculty] = [
        .architecture, .electricalEngineering, .design, .computerScience, .mechanicalEngineering, .businessAdministration
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        width = bounds.width
        height = bounds.height
        radiusOffset = (height - 60) / 12
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        width = bounds.width
        height = bounds.height
        radiusOffset = (height - 60) / 12
    }
    
    override func setInterestRatings(interest: Dictionary<PyramidFaculty, Int>) {
        for (key, value) in interest {
            switch value {
            case 0: interestRatings[key] = radiusOffset
            case 1: interestRatings[key] = radiusOffset * 2
            case 2: interestRatings[key] = radiusOffset * 3
            case 3: interestRatings[key] = radiusOffset * 4
            case 4: interestRatings[key] = radiusOffset * 5
            case 5: interestRatings[key] = radiusOffset * 6
            default: interestRatings[key] = radiusOffset
            }
        }
    }
    
    override func create() {
        for i in 0...5 {
            let stepper = CGFloat(i)
            
            createTextLayer(withInterest: interest[i], origin: getPoint(forDistance: radiusOffset * 8, angle: stepper * 60))
            
            createBackgroundGrid(offset: stepper)
        }
        
        for i in 1...7 {
            createBackgroundWeb(offset: radiusOffset * CGFloat(i))
        }

        createDataWeb(values: interestRatings)
    }
    
    private func getPoint(forDistance dist: CGFloat, angle: CGFloat) -> CGPoint {
        let angleInRadians: CGFloat = angle * .pi / 180
        let x = sin(angleInRadians) * dist + center.x
        let y = -cos(angleInRadians) * dist + center.y
        return CGPoint(x: x, y: y)
    }
    
    // MARK: grid
    
    private func createBackgroundGrid(offset: CGFloat) {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1.5
        shapeLayer.lineCap = .round
        
        path.move(to: center)
        path.addLine(to: getPoint(forDistance: radiusOffset * 7 + 1, angle: 60 * offset))
        
        shapeLayer.path = path.cgPath
        
        layer.addSublayer(shapeLayer)
    }
    
    // MARK: background web
    
    private func createBackgroundWeb(offset: CGFloat) {
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.customGrey.cgColor
        shapeLayer.lineWidth = 1
        
        path.move(to: getPoint(forDistance: offset, angle: 0))
        for i in 1...6 {
            path.addLine(to: getPoint(forDistance: offset, angle: CGFloat(i * 60)))
        }
        path.close()
        
        shapeLayer.path = path.cgPath
        
        layer.addSublayer(shapeLayer)
    }
    
    // MARK: data web
    
    private func createInitialDataPath() -> CGPath {
        let path = UIBezierPath()
        let maxDist = radiusOffset * 7
        let partitions = 6
        let degreeJumps = 360 / partitions
        let degreeOffset = -60
        path.move(to: getPoint(forDistance: maxDist, angle: CGFloat(degreeOffset)))
        
        for i in 1...partitions {
            path.addLine(to: getPoint(forDistance: maxDist, angle: CGFloat(i * degreeJumps + degreeOffset)))
        }
        
        path.close()
        
        return path.cgPath
    }
    
    private func createDataWeb(values: [PyramidFaculty: CGFloat]) {
        let initialPath = createInitialDataPath()
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.fillColor = UIColor.pyramidDarkBlue.withAlphaComponent(0.7).cgColor
        shapeLayer.strokeColor = UIColor.pyramidBlue.cgColor
        shapeLayer.lineWidth = 1.5
        
        path.move(to: getPoint(forDistance: values[.architecture]!, angle: 0))
        var stepper = 0
        for i in interest {
            if i == .architecture {
                stepper += 1
                continue
            }
            path.addLine(to: getPoint(forDistance: values[i]!, angle: CGFloat(stepper * 60)))
            stepper += 1
        }
        path.close()
        
        shapeLayer.path = path.cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = initialPath
        pathAnimation.duration = 1
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        shapeLayer.add(pathAnimation, forKey: "pathAnimation")
        
        layer.addSublayer(shapeLayer)
    }
    
    // MARK: text layer
    
    private func createTextLayer(withInterest interest: PyramidFaculty, origin: CGPoint) {
        let textLayer = CATextLayer()
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.font = UIFont(name: "Avenir", size: 8.0)
        textLayer.fontSize = 8.0
        textLayer.string = interest.rawValue
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        
        var y = origin.y
        if interest == .electricalEngineering ||
            interest == .businessAdministration ||
            interest == .computerScience {
            y -= 10
        }
        
        textLayer.frame = CGRect(origin: CGPoint(x: origin.x - 27, y: y), size: CGSize(width: 54, height: 10))
        
        layer.addSublayer(textLayer)
    }
    
}
