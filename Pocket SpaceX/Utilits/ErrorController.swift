//
//  ErrorController.swift
//  Pocket SpaceX
//
//  Created by Антон on 05.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ErrorController: UIViewController {
    
    
    let error: ApiErrors
    var errorLabel = UILabel()
    var errorImage = UIImageView()
    var descriptionLabel = UILabel()
    var button = LoadingButton()
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        return bdView
    } ()
    
    var isPresenting = false
    
    let menuView = UIView()
    let menuHeight = (UIScreen.main.bounds.height / 2.7)
    
    var retryHandle: (() -> ())?
    
    init(_ error: ApiErrors) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(backdropView)
        view.addSubview(menuView)
        menuView.backgroundColor = .white
        
        menuView.clipsToBounds = true
        menuView.layer.cornerRadius = 12
        
        menuView.snp.makeConstraints() { make in
            make.height.equalTo(menuHeight)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        menuView.addSubview(errorLabel)
        errorLabel.textAlignment = .center
        errorLabel.text = "We have a problem"
        errorLabel.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: menuHeight / 8)
        
        errorLabel.snp.makeConstraints() { make in
            make.top.equalTo(menuView.snp.top).offset(menuHeight / 40)
            make.left.equalTo(menuView.snp.left).offset(menuHeight / 40)
            make.right.equalTo(menuView.snp.right).offset(-(menuHeight / 40))
        }
        
        menuView.addSubview(button)
        button.configureButton(title: "Retry")
        button.snp.makeConstraints() { make in
            make.left.equalTo(menuView.snp.left).offset(menuHeight / 40)
            make.right.equalTo(menuView.snp.right).offset(-(menuHeight / 40))
            make.bottom.equalTo(menuView.snp.bottomMargin).offset(-(menuHeight / 40))
            
        }
        
        menuView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = error.description
        descriptionLabel.font = descriptionLabel.font.withSize(menuHeight / 16)
        descriptionLabel.snp.makeConstraints() { make in
            //            make.top.equalTo(errorImage.snp.bottom).offset(menuHeight / 40)
            make.bottom.equalTo(button.snp.top).offset(-(menuHeight / 40))
            make.left.equalTo(menuView.snp.left).offset(menuHeight / 40)
            make.right.equalTo(menuView.snp.right).offset(-(menuHeight / 40))
        }
        
        menuView.addSubview(errorImage)
        errorImage.contentMode = .scaleAspectFit
        errorImage.tintColor = .black
        errorImage.image = UIImage(systemName: "nosign")
        errorImage.snp.makeConstraints() { make in
            make.centerX.equalTo(menuView.snp.centerX)
            make.top.equalTo(errorLabel.snp.bottom).offset(menuHeight / 40)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-(menuHeight / 40))
            make.left.equalTo(menuView.snp.left).offset(menuHeight / 40)
            make.right.equalTo(menuView.snp.right).offset(-(menuHeight / 40))
        }
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    @ objc
    private func buttonTap() {
        button.isLoading = true
        button.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.retryHandle?()
        }
    }
    
    func tapHandle(_ retryHandle: (() -> ())?) {
        self.retryHandle = retryHandle
    }
    
    func repeatError() {
        button.isLoading = false
        button.isUserInteractionEnabled = true
        button.shake()
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension ErrorController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
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
