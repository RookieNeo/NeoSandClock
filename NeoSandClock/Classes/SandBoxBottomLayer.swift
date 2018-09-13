//
//  SandBoxBottomLayer.swift
//  NeoSandClock
//
//  Created by Neo on 2018/8/28.
//  Copyright © 2018年 Neo. All rights reserved.
//

import UIKit

public class SandBoxBottomLayer: CALayer {
    
    let sublayer1 = CAShapeLayer()
    
    init(frame : CGRect) {
        super.init()
        self.frame = frame
        self.configUI()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configUI() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height*1/3))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.width))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height*1/3))
        path.addLine(to: CGPoint(x: self.frame.width/2, y: 0))
        path.close()
        let sublayer = CAShapeLayer()
        sublayer.masksToBounds = true
        sublayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        sublayer.path = path.cgPath
        //我觉得加背景色反而不是很好看呢
//        self.backgroundColor = UIColor(red: 232/255.0, green: 159/255.0, blue: 159/255.0, alpha: 1).cgColor
        self.mask = sublayer
        
        sublayer1.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: self.frame.height)
        sublayer1.path = path.cgPath
        sublayer1.fillColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sublayer1)
    }
    func startAnimation() {
        sublayer1.removeAllAnimations()
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.keyTimes = [NSNumber(value: 0.0),NSNumber(value: SandClockView.animationTimeWithOutRotate/SandClockView.animationTime),NSNumber(value: 1.0)]
        animation.values = [CGPoint(x: self.frame.width/2, y: self.frame.height*1.5),CGPoint(x: self.frame.width/2, y: self.frame.height/2),CGPoint(x: self.frame.width/2, y: self.frame.height/2)]
        animation.duration = SandClockView.animationTime
        animation.isRemovedOnCompletion = true
        animation.repeatCount = MAXFLOAT
        animation.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.8, 0, 1, 1)]
        animation.fillMode = kCAFillModeForwards
        sublayer1.add(animation, forKey: "")
    }
}
