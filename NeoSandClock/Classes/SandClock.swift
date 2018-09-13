//
//  SandClock.swift
//  NeoSandClock
//
//  Created by Neo on 2018/8/29.
//  Copyright © 2018年 Neo. All rights reserved.
//

import Foundation
import UIKit
public class SandClock{
    
    /// 添加沙漏Loading动画
    ///
    /// - Parameters:
    ///   - superView: 要添加进的视图
    ///   - position: 要添加到的位置 默认=superView.center
    /// - Returns: 返回沙漏动画的视图 可忽略
    @discardableResult class func show(withSuperView superView : UIView,position: CGPoint? = nil) -> SandClockControlView{
        let view = SandClockControlView()
        view.frame = CGRect(x: 0, y: 0, width: 270, height: 120)
        view.center = position == nil ? superView.center : position!
        superView.addSubview(view)
        return view
    }
    
    /// 移除沙漏动画
    ///
    /// - Parameter superView: 沙漏视图的父View
    /// - Returns: 是否移除成功 可忽略
    @discardableResult class func remove(withSuperView superView: UIView) -> Bool{
        for subView in superView.subviews{
            if let sandClockView = subView as? SandClockControlView{
                sandClockView.removeFromSuperview()
                return true
            }
        }
        return false
    }
}
