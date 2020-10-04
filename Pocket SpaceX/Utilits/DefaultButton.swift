//
//  DefaultButton.swift
//  Pocket SpaceX
//
//  Created by Антон on 04.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {
    private var shadowLayer: CAShapeLayer!
    lazy private var loadingView = ButtonLoadingView()
    
    override var isEnabled: Bool {
        didSet {
            guard oldValue != isEnabled else { return }
            UIView.animate(withDuration: 0.3) {
                self.alpha = self.isEnabled ? 1 : 0.5
            }
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            guard oldValue != isLoading else { return }
            isLoading ? startLoading() : stopLoading()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 11
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.35
        layer.shadowOffset = .init(width: 5, height: 7)
        layer.shadowRadius = 10
    }
    
    private func commonInit() {
        setTitleColor(.white, for: .normal)
        backgroundColor = #colorLiteral(red: 0.262745098, green: 0.3607843137, blue: 0.8784313725, alpha: 1)
    }
    
    private func startLoading() {
        addSubview(loadingView)
        setTitleColor(backgroundColor, for: .normal)
        loadingView.snp.makeConstraints() { make in
            make.center.equalTo(snp.center)
            make.height.equalTo(16)
            make.width.equalTo(42)
        }
        loadingView.animate()
    }
    
    private func stopLoading() {
        setTitleColor(.white, for: .normal)
        loadingView.removeFromSuperview()
    }
    
    func doneAction(title: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isLoading = false
            self.setTitle("Done!", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.setTitle(title, for: .normal)
            }
        }
    }
}




class ButtonLoadingView: UIView {
    
    private static let animationDuration: Double = 1
    private static let instanceCount = 3
    
    private var replicator : CAReplicatorLayer = {
        let replicator = CAReplicatorLayer()
        replicator.instanceDelay = ButtonLoadingView.animationDuration / TimeInterval(ButtonLoadingView.instanceCount)
        replicator.instanceCount = ButtonLoadingView.instanceCount
        return replicator
    }()
    
    private var replicatorItem : CALayer = {
        let replicatorItem = CALayer()
        replicatorItem.backgroundColor = UIColor.white.cgColor
        return replicatorItem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        isUserInteractionEnabled = false
        layer.addSublayer(replicator)
        replicator.addSublayer(replicatorItem)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let replicatorItemRadius = bounds.width / 5
        replicatorItem.frame = CGRect(x: 0,y: 0, width: replicatorItemRadius, height: replicatorItemRadius)
        replicatorItem.cornerRadius = replicatorItemRadius / 2
        replicator.instanceTransform = CATransform3DMakeTranslation(replicatorItemRadius * 2, 0, 0)
        animate()
    }
    
    func animate() {
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.duration = ButtonLoadingView.animationDuration
        alphaAnimation.fromValue = 1
        alphaAnimation.toValue = 0.1
        alphaAnimation.autoreverses = true
        alphaAnimation.repeatCount = .infinity
        replicatorItem.add(alphaAnimation, forKey: nil)
        
        let moveAnimation = CABasicAnimation(keyPath: "position.y")
        moveAnimation.fromValue = replicatorItem.bounds.height / 2
        moveAnimation.toValue = bounds.height - replicatorItem.bounds.height / 2
        moveAnimation.duration = ButtonLoadingView.animationDuration / 2
        moveAnimation.autoreverses = true
        moveAnimation.repeatCount = .infinity
        replicatorItem.add(moveAnimation, forKey: nil)
    }
    
}
