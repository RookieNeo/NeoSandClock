//
//  SandClockView.swift
//  NeoSandClock
//
//  Created by Neo on 2018/8/27.
//  Copyright © 2018年 Neo. All rights reserved.
//

import UIKit

public class SandClockView: UIView {
    static let animationTime = 6.5                  //沙漏滴完+旋转的时间
    static let animationTimeWithOutRotate = 6.1     //沙漏滴完的时间
    static let sandAnimationTime05 = 0.5            //沙子下坠时间 共3中
    static let sandAnimationTime03 = 0.3
    static let sandAnimationTime01 = 0.1
    
    private let boxWidth: CGFloat = 34
    private let boxHeight: CGFloat = 25
    lazy var topLayer: SandBoxTopLayer = {
        let layer = SandBoxTopLayer(frame: CGRect(x: 7, y: 3, width: boxWidth , height: boxHeight))
        return layer
    }()
    lazy var bottomLayer: SandBoxBottomLayer = {
        let layer = SandBoxBottomLayer(frame: CGRect(x: 7, y: self.frame.height/2-1, width: boxWidth, height: boxHeight))
        return layer
    }()
    lazy var sandLayer: SandLayer = {
        let layer = SandLayer(frame: CGRect(x: self.frame.width/2-1, y: self.frame.height/2, width: 2, height: 25))
        layer.masksToBounds = true
        return layer
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configUI() {
        self.layer.addSublayer(bottomLayer)
        self.layer.addSublayer(sandLayer)
        self.layer.addSublayer(topLayer)
        let bundle = Bundle.init(for: SandClockView.self)
        let image = UIImage(named: "sandclock_bg", in: bundle, compatibleWith: nil)//UIImage.init(contentsOfFile: imageBunlde!.path(forResource: "sandclock_bg", ofType: "png")!)
        let imageView = UIImageView(image: image!)
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
    func startAnimation(){
        topLayer.startAnimation()
        bottomLayer.startAnimation()
        sandLayer.startAnimation()
        self.layer.removeAllAnimations()
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.keyTimes = [NSNumber(value: 0.0),NSNumber(value: SandClockView.animationTimeWithOutRotate/SandClockView.animationTime),NSNumber(value:0.97),NSNumber(value: 1.0)]
        animation.values = [0,0,Double.pi+0.07,Double.pi]
        animation.duration = SandClockView.animationTime
        animation.isRemovedOnCompletion = true
        animation.repeatCount = MAXFLOAT
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                     CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                     CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                     CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        animation.fillMode = kCAFillModeForwards
        self.layer.add(animation, forKey: "")
    }
}
