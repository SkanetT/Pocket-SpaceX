//
//  LaunchpadInfoController.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import MapKit

class LaunchpadInfoController: SpinnerController {
    
    var presenter: LaunchpadInfoPresenterInput?
    var mapHandler: LaunchpadInfoMapHandlerProtocol?
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var attemptedView: UIView!
    @IBOutlet weak var attemptedLabel: UILabel!
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        mapHandler?.attach(mapView)
        presenter?.viewDidLoad()
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
}

extension LaunchpadInfoController: LaunchpadInfoPresenterOutput {
    func configureUI() {
        
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        mapView.clipsToBounds = true
        mapView.layer.cornerRadius = 8
        
        statusLabel.clipsToBounds = true
        statusLabel.layer.cornerRadius = 8
        statusLabel.alpha = 0.95
        
        attemptedView.clipsToBounds = true
        attemptedView.layer.cornerRadius = 8
        attemptedView.alpha = 0.95
        
        successView.clipsToBounds = true
        successView.layer.cornerRadius = 8
        successView.alpha = 0.95
        
        fullNameLabel.alpha = 0.95
        
        detailsLabel.clipsToBounds = true
        detailsLabel.layer.cornerRadius = 8
        detailsLabel.backgroundColor = Colors.lowBlue
        detailsLabel.alpha = 0.95
       
        showSpinner()
    }
    
    func didReceiveLaunchpadInfoData(_ data: LaunchpadDatum) {
        mapHandler?.setData(data)
        
        DispatchQueue.main.async {
            self.title = data.name
            self.statusLabel.text = data.status.capitalized
            self.fullNameLabel.text = data.fullName
            self.detailsLabel.text = data.details
            self.attemptedLabel.text = data.launchAttempts.description
            self.successLabel.text = data.launchSuccesses.description
        }
        removeSpinner()
    }
    
}
