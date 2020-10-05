//
//  LaunchRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchRouter: LaunchRouting {
    
    private weak var viewController: SpinnerController?
    var refresh: (() -> ())?
    weak var delegate: MenuDelegate?
    var isError = false
    
    init(_ viewController: SpinnerController) {
        self.viewController = viewController
    }
    
    func showSideMenu() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func showError(_ error: ApiErrors) {
        if isError == false {
            viewController?.showError(error)
            viewController?.tapErrorHandle() {[weak self] () in
                self?.refresh?()
            }
        }
        isError = true
    }
    
    func removeError() {
        viewController?.removeError()
        isError = false
    }
    
    func presentLaunchInfo(_ data: LaunchDatum) {
        let vc = LaunchInfoAssembler.createModule(data: data)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
    
}
