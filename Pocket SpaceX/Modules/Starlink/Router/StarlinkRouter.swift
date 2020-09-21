//
//  StarlinkRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SafariServices

class StarlinkRouter: StarlinkRouting {
    private weak var viewController: UIViewController?
    var refresh: (() -> ())?
    private let url = "https://en.wikipedia.org/wiki/Starlink"
    
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