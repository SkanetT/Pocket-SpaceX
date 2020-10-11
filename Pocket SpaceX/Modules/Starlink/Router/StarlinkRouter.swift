//
//  StarlinkRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SafariServices

final class StarlinkRouter: StarlinkRouting {
    private weak var viewController: SpinnerController?
    var refresh: (() -> ())?
    private let url = "https://en.wikipedia.org/wiki/Starlink"
    
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
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
    
    func presentWiki() {
        if let url = URL(string: url) {
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .fullScreen
            viewController?.present(vc, animated: true)
        }
    }
}
