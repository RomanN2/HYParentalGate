//
//  HYCheckBox.swift
//  HYParentalGateExample
//
//  Created by Roman Nazarkevych on 10/28/16.
//  Copyright © 2016 25 Happy Eyes. All rights reserved.
//

import UIKit

class HYCheckBox: UIView {
    
    var checkMarkColor: CGColor?
    
    @objc func drawCheck() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.frame.size.height / 2.0))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = checkMarkColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 15.0
        pathLayer.lineJoin = CAShapeLayerLineJoin.round
        self.layer.addSublayer(pathLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 0.5
        pathAnimation.fromValue = NSNumber(value: 0)
        pathAnimation.toValue = NSNumber(value: 1.0)
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
    }

}
