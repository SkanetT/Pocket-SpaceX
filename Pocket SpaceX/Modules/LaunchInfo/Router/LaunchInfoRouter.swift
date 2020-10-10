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
import SafariServices

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
        let vc = RocketInfoAssembler.createModule(rocketId: id)
        let nc = UINavigationController(rootViewController: vc)
        viewController?.present(nc, animated: true, completion: nil)
    }
    
    func launchpadInfoPresent(_ id: String) {
        let vc = LaunchpadInfoAssembler.createModule(launchpadId: id)
        let nc = UINavigationController(rootViewController: vc)
        viewController?.present(nc, animated: true, completion: nil)
    }
    
    func sharePresent(_ links: Links, isShare: Bool) {
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let campaign = links.reddit.campaign {
            let campaignAction = UIAlertAction(title: "Reddit campaign", style: .default, handler: { [weak self] _ in
                if isShare {
                    self?.share(campaign)
                } else {
                    self?.safari(campaign)
                }
            })
            ac.addAction(campaignAction)
        }
        
        if let launch = links.reddit.launch {
            let launchAction = UIAlertAction(title: "Reddit launch", style: .default, handler: { [weak self] _ in
                if isShare {
                    self?.share(launch)
                } else {
                    self?.safari(launch)
                }
            })
            ac.addAction(launchAction)
        }
        
        if let media = links.reddit.media {
            let mediaAction = UIAlertAction(title: "Reddit media", style: .default, handler: { [weak self] _ in
                if isShare {
                    self?.share(media)
                } else {
                    self?.safari(media)
                }
            })
            ac.addAction(mediaAction)
        }
        
        if let recovery = links.reddit.recovery {
            let recoveryAction = UIAlertAction(title: "Reddit recovery", style: .default, handler: { [weak self] _ in
                if isShare {
                    self?.share(recovery)
                } else {
                    self?.safari(recovery)
                }
            })
            ac.addAction(recoveryAction)
        }
        
        if let wikipedia = links.wikipedia {
            let wikipediaAction = UIAlertAction(title: "Wikipedia", style: .default, handler: { [weak self] _ in
                if isShare {
                    self?.share(wikipedia)
                } else {
                    self?.safari(wikipedia)
                }
            })
            ac.addAction(wikipediaAction)
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(cancel)
        
        viewController?.present(ac, animated: true, completion: nil)
    }
    
    private func share(_ urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let items = [url]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        viewController?.present(ac, animated: true)
    }
    
    private func safari(_ urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true)
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
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension LaunchInfoRouter: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        viewController?.dismiss(animated: true, completion: nil)
    }
}


