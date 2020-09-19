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
    var refresh: (() -> ())?
    weak var delegate: MenuDelegate?
    
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showSideMenu() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func showError(_ error: ApiErrors) {
        DispatchQueue.main.async {
            let ac = UIAlertController()
            ac.addAction(.init(title: error.description, style: .default, handler: { [weak self] action in
                self?.refresh?()
            }))
            self.viewController?.present(ac, animated: true, completion: nil)
        }
    }
    
    func presentLaunchInfo(_ data: LaunchDatum) {
        let vc = LaunchInfoAssembler.createModule(data: data)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
    
}
