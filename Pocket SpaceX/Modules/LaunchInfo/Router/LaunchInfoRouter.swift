//
//  LaunchInfoRouter.swift
//  Pocket SpaceX
//
//  Created by Антон on 21.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class LaunchInfoRouter: NSObject, LaunchInfoRouting {
    
    private weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showEventEditView(eventStore: EKEventStore, event: EKEvent) {
        DispatchQueue.main.async {
            let vc = EKEventEditViewController()
            vc.editViewDelegate = self
            vc.eventStore = eventStore
            vc.event = event
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
    func showAddEventError(_ error: Error?) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Need access", message: "Go to settings", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            ac.addAction(ok)
            self.viewController?.present(ac, animated: true, completion: nil)
        }
    }
    
}

extension LaunchInfoRouter: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}


