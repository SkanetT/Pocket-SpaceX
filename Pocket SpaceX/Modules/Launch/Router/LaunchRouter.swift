//
//  LaunchRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchRouter: LaunchRouting {
    
    private weak var viewController: UIViewController?
    weak var delegate: MenuDelegate?
    
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showSideMenu() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}
