//
//  LaunchInfoController.swift
//  Pocket SpaceX
//
//  Created by Антон on 15.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import EventKit
import EventKitUI

class LaunchInfoController: UIViewController {
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    
    var presenter: LaunchInfoPresenterInput?
    var youtubeHandler: LaunchInfoYoutubeHandlerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        youtubeHandler?.attach(youtubeView)
        presenter?.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    @objc
    private func handleEvent() {
        // presenter?.addEventTap()
        //    let event  = CalendarManager.makeEvent()
        
        let vc = EKEventEditViewController()
        vc.editViewDelegate = self
        vc.eventStore = EKEventStore()
        let event = EKEvent(eventStore: vc.eventStore)
        event.title = "Test Title4444"
        event.startDate = Date()
        event.endDate = Date()
        event.notes = "This is a note"
        present(vc, animated: true, completion: nil)
        
    }
    
}

extension LaunchInfoController: LaunchInfoPresenterOutput {
    func didReceiveLaunchInfoData(_ data: LaunchDatum) {
        title = data.name
        if let id = data.links.youtubeID {
            youtubeHandler?.setData(id)
        }
        if data.upcoming {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: self, action: #selector(handleEvent))
            navigationItem.rightBarButtonItem?.tintColor = .black
            
            
        }
        
    }
    
}

extension LaunchInfoController: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
