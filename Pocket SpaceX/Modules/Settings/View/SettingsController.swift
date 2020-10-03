//
//  SettingsController.swift
//  Pocket SpaceX
//
//  Created by Антон on 29.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    var presenter: SettingsPresenterInput?
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        return bdView
    } ()
    
    let menuView = UIView()
    let menuHeight = (UIScreen.main.bounds.height / 2.1)
    let okButton = UIButton()
    let cacheButton = UIButton()
    let infoLabel = UILabel()
    let viewForVideoSwitch = UIView()
    let videoLabel = UILabel()
    let videoSwitch = UISwitch()
    
    var isPresenting = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.attach(self)
        presenter?.viewDidLoad()
    }
    
    private func configureUI() {
        view.backgroundColor = .clear
        view.addSubview(backdropView)
        view.addSubview(menuView)
        
        menuView.clipsToBounds = true
        menuView.layer.cornerRadius = 8

        menuView.backgroundColor = .white
        menuView.snp.makeConstraints() { make in
            make.height.equalTo(menuHeight)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        menuView.addSubview(okButton)
        okButton.backgroundColor = .darkGray
        okButton.setTitle("Ok", for: .normal)
        okButton.clipsToBounds = true
        okButton.layer.cornerRadius = 8
    
        okButton.snp.makeConstraints() { make in
            make.bottom.equalTo(menuView.snp.bottom).offset(-16)
            make.height.equalTo(menuHeight / 8)
            make.leading.equalTo(menuView.snp.leading).offset(8)
            make.trailing.equalTo(menuView.snp.trailing).offset(-8)
        }
        
        menuView.addSubview(cacheButton)
        cacheButton.backgroundColor = .darkGray
        cacheButton.setTitle("Clear cache", for: .normal)
        cacheButton.clipsToBounds = true
        cacheButton.layer.cornerRadius = 8
        
        cacheButton.snp.makeConstraints() { make in
            make.bottom.equalTo(okButton.snp.top).offset(-16)
            make.height.equalTo(menuHeight / 8)
            make.leading.equalTo(menuView.snp.leading).offset(8)
            make.trailing.equalTo(menuView.snp.trailing).offset(-8)
        }
        
        menuView.addSubview(infoLabel)
        infoLabel.adjustsFontSizeToFitWidth = true
        infoLabel.minimumScaleFactor = 0.7
        infoLabel.textAlignment = .center
        infoLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(cacheButton.snp.top).offset(-(menuHeight / 40))
            make.trailing.equalTo(menuView.snp.trailing)
            make.leading.equalTo(menuView.snp.leading)
            make.height.equalTo(menuHeight / 10)
        }
        
        menuView.addSubview(viewForVideoSwitch)
        viewForVideoSwitch.backgroundColor = .lightGray
        viewForVideoSwitch.snp.makeConstraints() { make in
            make.bottom.equalTo(infoLabel.snp.top).offset(-(menuHeight / 40))
            make.trailing.equalTo(menuView.snp.trailing)
            make.leading.equalTo(menuView.snp.leading)
            make.height.equalTo(menuHeight / 8)
        }
        
        viewForVideoSwitch.addSubview(videoSwitch)
        videoSwitch.snp.makeConstraints() { make in
            make.centerY.equalTo(viewForVideoSwitch.snp.centerY)
            make.right.equalTo(viewForVideoSwitch.snp.right).offset(-8)
        }
        
        
        viewForVideoSwitch.addSubview(videoLabel)
        videoLabel.text = "Start playback instantly"
        videoLabel.adjustsFontSizeToFitWidth = true
        videoLabel.minimumScaleFactor = 0.7
        videoLabel.textAlignment = .left
        videoLabel.snp.makeConstraints() { make in
            make.centerY.equalTo(viewForVideoSwitch.snp.centerY)
            make.left.equalTo(viewForVideoSwitch.snp.left).offset(8)
            make.right.equalTo(videoSwitch.snp.left).offset(-8)
        }
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let swipeGetsure = UISwipeGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        swipeGetsure.direction = .down
        backdropView.addGestureRecognizer(tapGesture1)
        okButton.addGestureRecognizer(tapGesture2)
        view.addGestureRecognizer(swipeGetsure)
        
        videoSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
    }
    
    @objc
    private func handleTap(_ sender: UITapGestureRecognizer) {
        presenter?.dismissRequest()
    }
    
    @objc
    private func switchValueDidChange(_ sender: UISwitch) {
        if sender.isOn {
            presenter?.videoSettingsChange(true)
        } else {
            presenter?.videoSettingsChange(false)
        }
    }
}

extension SettingsController: SettingsPresenterOutput {
    func didReceiveVideoStatus(_ status: Bool) {
        DispatchQueue.main.async {
            self.videoSwitch.isOn = status
        }
    }
    
    func didReceiveInfoText(_ info: String) {
        DispatchQueue.main.async {
            self.infoLabel.text = info
        }
    }
}

extension SettingsController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: .to)
        guard let toVC = toViewController else { return }
        isPresenting.toggle()
        
        if isPresenting {
            containerView.addSubview(toVC.view)
            
            menuView.frame.origin.y += menuHeight
            backdropView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
                self.backdropView.alpha = 1
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
                self.backdropView.alpha = 0
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })
        }
    }
}
