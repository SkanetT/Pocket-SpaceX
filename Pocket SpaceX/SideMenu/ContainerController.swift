//
//  ContainerController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menuController: MenuController!
    var centerContoller: UIViewController!
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLaunchController()
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    private func configureLaunchController() {
        let vc = LaunchAssembler.createModule(delegate: self)
        
        centerContoller = UINavigationController(rootViewController: vc)
        
        centerContoller.view.frame = view.frame
        view.addSubview(centerContoller.view)
        
        addChild(centerContoller)
        centerContoller.didMove(toParent: self)
    }
    
    private func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            
            view.insertSubview(menuController.view, at: 0)
            
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
        
    }
    
    private func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                //    self.view.frame.size.height -= 80
                //    self.view.frame.origin.y += 40
                
                self.centerContoller.view.frame.origin.x  = self.centerContoller.view.frame.width - 80
                
            }, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                //   self.view.frame.size.height += 80
                //     self.view.frame.origin.y -= 40
                
                self.centerContoller.view.frame.origin.x  = 0
                
            }, completion: {[weak self] _ in
                guard let menuOption = menuOption else { return }
                
                self?.didSelectMenuOption(menuOption: menuOption)
                
            })
        }
        //  animateStatusBar()
    }
    
    private func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .rockets:
            let vc = RocketAssembler.createModule()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            present(nc, animated: true)
        case .starlink:
            let vc = StarlinkAssembler.createModule()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            present(nc, animated: true)
        case .launchpads:
            let vc = LaunchpadAssembler.createModule()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            present(nc, animated: true)
        case .settings:
            print("settings")

        }
    }
}

extension ContainerController: MenuDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded.toggle()
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}

