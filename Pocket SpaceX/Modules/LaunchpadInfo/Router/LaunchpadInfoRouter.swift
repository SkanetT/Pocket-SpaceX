//
//  LaunchpadInfoRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class LaunchpadInfoRouter: LaunchpadInfoRouting {
    
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
        viewController?.tapErrorHandle() { [weak self] () in
            self?.refresh?()
        }
    }
    
    func repeatError() {
        viewController?.repeatError()
    }
    
    func removeError() {
        viewController?.removeError()
    }
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
}
