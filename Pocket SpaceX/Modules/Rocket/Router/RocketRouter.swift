//
//  RocketRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketRouter: RocketRouting {
    
    private weak var viewController: SpinnerController?
    var refresh: (() -> ())?

    
    init(_ viewController: SpinnerController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func showError(_ error: ApiErrors) {
        viewController?.showError(error)
        viewController?.tapErrorHandle() {[weak self] () in
            self?.refresh?()
        }
    }
    
    func repeatError() {
        viewController?.repeatError()
    }
    
    func removeError() {
        viewController?.removeError()
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
