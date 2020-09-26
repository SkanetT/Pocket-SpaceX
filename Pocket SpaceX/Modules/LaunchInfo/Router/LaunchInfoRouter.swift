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
            self.openSettingAlert()
        }
    }
    
    func rocketInfoPresent(_ id: String) {
        let vk = RocketInfoAssembler.createModule(rocketId: id)
        let nc = UINavigationController(rootViewController: vk)
        viewController?.present(nc, animated: true, completion: nil)
    }
    
    private func openSettingAlert() {
        let alertController = UIAlertController (title: "No access to Calendar", message: "Go to Settings?", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ -> () in
            
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl) { success in
                }
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}

extension LaunchInfoRouter: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}


