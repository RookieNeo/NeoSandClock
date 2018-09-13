//
//  SandClockControlView.swift
//  NeoSandClock
//
//  Created by Neo on 2018/8/29.
//  Copyright © 2018年 Neo. All rights reserved.
//

import UIKit
@IBDesignable
public class SandClockControlView: UIView {

    var title: String = ""{
        didSet{
            titleLabel.text = title
        }
    }
    var subTitle: String = "" {
        didSet{
            subTitleLabel.text = subTitle
        }
    }
    
    private lazy var sandClockView: SandClockView = {
        let view = SandClockView(frame: CGRect(x: 0, y: 0, width: 48, height: 56))
        return view
    }()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var containerSandClockView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
        setCommon()
    }
    
    /// 使用Xib创建不需要宽高约束，由内部控件撑开
    ///
    /// - Parameter aDecoder: aDecoder
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
        setCommon()
    }
    
    private func setCommon() {
        self.backgroundColor = UIColor.clear
        self.containerSandClockView.addSubview(sandClockView)
        sandClockView.startAnimation()
    }
    
    private func xibSetUp(name: String? = nil){
        let nibName = name ?? type(of: self).description().components(separatedBy: ".").last!
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView  else { return }
        addSubviewWithAnchorZero(view)
        addSubviewWithCenter(view)
    }
    
    private func addSubviewWithAnchorZero(_ v: UIView) {
        if !subviews.contains(v) {
            insertSubview(v, at: 0)
        }
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: v.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: v.trailingAnchor),
                                     topAnchor.constraint(equalTo: v.topAnchor),
                                     bottomAnchor.constraint(equalTo: v.bottomAnchor)
            ])
    }
    
    private func addSubviewWithCenter(_ v: UIView) {
        if !subviews.contains(v) {
            insertSubview(v, at: 0)
        }
        v.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([centerXAnchor.constraint(equalTo: v.centerXAnchor),
                                     centerYAnchor.constraint(equalTo: v.centerYAnchor)
            ])
    }

}
