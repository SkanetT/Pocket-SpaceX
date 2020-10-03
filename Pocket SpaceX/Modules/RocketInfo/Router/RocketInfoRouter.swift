//
//  RocketInfoRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SafariServices

class RocketInfoRouter: RocketInfoRouting {
    
    private weak var viewController: UIViewController?
    var refresh: (() -> ())?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
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
    
    func needRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
    
    func presentWiki(_ url: String) {
        if let url = URL(string: url) {
            let vc = SFSafariViewController(url: url)
            vc.modalPresentationStyle = .fullScreen
            viewController?.present(vc, animated: true)
        }
    }
    
}
