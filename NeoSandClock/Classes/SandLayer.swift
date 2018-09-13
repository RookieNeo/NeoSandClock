//
//  SandLayer.swift
//  NeoSandClock
//
//  Created by Neo on 2018/8/28.
//  Copyright © 2018年 Neo. All rights reserved.
//

import UIKit

public class SandLayer: CALayer {
    //第一组沙粒
    let sand05Layer = CALayer()
    let sand05Layer1 = CALayer()
    //第二组沙粒
    let sand03Layer = CALayer()
    let sand03Layer1 = CALayer()
    //第三组沙粒
    let sand01Layer = CALayer()
    let sand01Layer1 = CALayer()
    init(frame: CGRect) {
        super.init()
        self.frame = frame
        self.configUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configUI() {
        sand05Layer.frame = CGRect(x: 0, y: -3, width: 1, height: 1)
        sand05Layer.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand05Layer)
        sand05Layer1.frame = CGRect(x: 1, y: -10, width: 1, height: 2)
        sand05Layer1.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand05Layer1)
        
        sand03Layer.frame = CGRect(x: 0, y: -10, width: 1, height: 2)
        sand03Layer.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand03Layer)
        sand03Layer1.frame = CGRect(x: 1, y: -3, width: 1, height: 1)
        sand03Layer1.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand03Layer1)
//
        sand01Layer.frame = CGRect(x: 0, y: -3, width: 1, height: 1)
        sand01Layer.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand01Layer)
        sand01Layer1.frame = CGRect(x: 1, y: -10, width: 1, height: 2)
        sand01Layer1.backgroundColor = UIColor(red: 206/255.0, green: 206/255.0, blue: 213/255.0, alpha: 1).cgColor
        self.addSublayer(sand01Layer1)
    }
    func startAnimation() {
        self.addAnimation(withDuration: SandClockView.sandAnimationTime05, layer: sand05Layer)
        self.addAnimation(withDuration: SandClockView.sandAnimationTime05, layer: sand05Layer1)
        self.addAnimation(withDuration: SandClockView.sandAnimationTime03, layer: sand03Layer)
        self.addAnimation(withDuration: SandClockView.sandAnimationTime03, layer: sand03Layer1)
        self.addAnimation(withDuration: SandClockView.sandAnimationTime01, layer: sand01Layer)
        self.addAnimation(withDuration: SandClockView.sandAnimationTime01, layer: sand01Layer1)
    }
    private func addAnimation(withDuration duration: CFTimeInterval,layer: CALayer){
        layer.removeAllAnimations()
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = layer.position
        animation.toValue = CGPoint(x: layer.position.x, y: self.frame.height)
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.repeatCount = MAXFLOAT
        animation.valueFunction = CAValueFunction(name: kCAMediaTimingFunctionLinear)
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: nil)
    }
}
