//
//  SettingsRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SettingsRouter: SettingsRouting {
    private weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
