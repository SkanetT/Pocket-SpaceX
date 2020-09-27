//
//  RocketRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketRouter: RocketRouting {
    
    private weak var viewController: UIViewController?
    var refresh: (() -> ())?

    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func showError(_ error: ApiErrors) {
        let ac = UIAlertController()
        ac.addAction(.init(title: error.description, style: .default, handler: { [weak self] action in
            self?.refresh?()
        }))
       viewController?.present(ac, animated: true, completion: nil)
    }
    
    func rocketInfoPresent(id: String) {
        let vc = RocketInfoAssembler.createModule(rocketId: id)
        vc.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
}
