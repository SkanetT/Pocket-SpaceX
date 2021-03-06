//
//  SettingsController.swift
//  Pocket SpaceX
//
//  Created by Антон on 29.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class SettingsController: UIViewController {
    
    var presenter: SettingsPresenterInput?
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        return bdView
    } ()
    
    let menuView = UIView()
    let menuHeight = (UIScreen.main.bounds.height / 2.1)
    let closeButton = UIButton()
    let cacheButton = LoadingButton()
    let infoLabel = UILabel()
    let infoView = UIView()
    let infoStack = UIStackView()
    let projectLabel = UILabel()
    let versionLabel = UILabel()
    let buildLabel = UILabel()
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
        presenter?.attach(self)
        presenter?.viewDidLoad()
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
    
    @objc
    private func clearCacheHandle(_ sender: LoadingButton) {
        cacheButton.isLoading = true
        presenter?.clearTap()
    }
    
}

extension SettingsController: SettingsPresenterOutput {
    func configureUI() {
        
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
        menuView.addSubview(closeButton)
        closeButton.configureButton(title: "Close")
        
        closeButton.snp.makeConstraints() { make in
            make.bottom.equalTo(menuView.snp.bottom).offset(-16)
            make.height.equalTo(menuHeight / 8)
            make.leading.equalTo(menuView.snp.leading).offset(8)
            make.trailing.equalTo(menuView.snp.trailing).offset(-8)
        }
        
        menuView.addSubview(cacheButton)
        cacheButton.setTitle("Clear cache", for: .normal)
        cacheButton.clipsToBounds = true
        cacheButton.layer.cornerRadius = 8
        
        cacheButton.snp.makeConstraints() { make in
            make.bottom.equalTo(closeButton.snp.top).offset(-(menuHeight / 40))
            make.height.equalTo(menuHeight / 8)
            make.leading.equalTo(menuView.snp.leading).offset(8)
            make.trailing.equalTo(menuView.snp.trailing).offset(-8)
        }
        
        cacheButton.addTarget(self, action: #selector(clearCacheHandle(_ :)), for: .touchUpInside)
        
        menuView.addSubview(viewForVideoSwitch)
        viewForVideoSwitch.backgroundColor = Colors.lowBlue
        viewForVideoSwitch.snp.makeConstraints() { make in
            make.bottom.equalTo(cacheButton.snp.top).offset(-(menuHeight / 40))
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
        videoLabel.font = UIFont(name: "TimesNewRomanPSMT", size: menuHeight / 16)
        videoLabel.adjustsFontSizeToFitWidth = true
        videoLabel.minimumScaleFactor = 0.6
        videoLabel.textAlignment = .left
        videoLabel.snp.makeConstraints() { make in
            make.centerY.equalTo(viewForVideoSwitch.snp.centerY)
            make.left.equalTo(viewForVideoSwitch.snp.left).offset(8)
            make.right.equalTo(videoSwitch.snp.left).offset(-8)
        }
        
        menuView.addSubview(infoView)
        
        infoView.clipsToBounds = true
        infoView.backgroundColor = Colors.lowGray
        infoView.setShadow(color: .black)
        infoView.layer.borderColor = UIColor.black.cgColor
        infoView.layer.borderWidth = 2
        infoView.layer.cornerRadius = 8
        infoView.snp.makeConstraints() { make in
            make.top.equalTo(menuView.snp.top).offset(8)
            make.left.equalTo(menuView.snp.left).offset(8)
            make.right.equalTo(menuView.snp.right).offset(-8)
            make.bottom.equalTo(viewForVideoSwitch.snp.top).offset(-8)
        }
        
        
        infoView.addSubview(infoStack)
        infoStack.axis = .vertical
        infoStack.distribution = .fillEqually
        infoStack.snp.makeConstraints() { make in
            make.top.equalTo(infoView.snp.top)
            make.trailing.equalTo(infoView.snp.trailing)
            make.leading.equalTo(infoView.snp.leading)
            make.bottom.equalTo(infoView.snp.bottom)
        }
        
        infoStack.addArrangedSubview(projectLabel)
        projectLabel.textAlignment = .center
        projectLabel.text = "Pocket SpaceX"
        projectLabel.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: view.bounds.height / 20)
        projectLabel.textColor = Colors.blue
        projectLabel.snp.makeConstraints() { make in
            make.left.equalTo(infoStack.snp.left)
            make.right.equalTo(infoStack.snp.right)
            
        }
        
        infoStack.addArrangedSubview(versionLabel)
        versionLabel.textAlignment = .center
        versionLabel.text = "Version"
        versionLabel.font = UIFont(name: "TimesNewRomanPSMT", size: view.bounds.height / 32)
        versionLabel.snp.makeConstraints() { make in
            make.left.equalTo(infoStack.snp.left)
            make.right.equalTo(infoStack.snp.right)
            
        }
        infoStack.addArrangedSubview(buildLabel)
        buildLabel.textAlignment = .center
        buildLabel.text = "Build"
        buildLabel.font = UIFont(name: "TimesNewRomanPSMT", size: view.bounds.height / 32)
        buildLabel.snp.makeConstraints() { make in
            make.left.equalTo(infoStack.snp.left)
            make.right.equalTo(infoStack.snp.right)
            
        }
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let swipeGetsure = UISwipeGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        swipeGetsure.direction = .down
        backdropView.addGestureRecognizer(tapGesture1)
        closeButton.addGestureRecognizer(tapGesture2)
        view.addGestureRecognizer(swipeGetsure)
        
        videoSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
    }
    
    
    func didReceiveVideoStatus(_ status: Bool) {
        DispatchQueue.main.async {
            self.videoSwitch.isOn = status
        }
    }
    
    func didReceiveInfoText(version: String, build: String) {
        DispatchQueue.main.async {
            self.versionLabel.text = "Version \(version)"
            self.buildLabel.text = "Build \(build)"
        }
    }
    
    func didDeleteCache() {
        cacheButton.doneAction(title: "Clear cache")
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
