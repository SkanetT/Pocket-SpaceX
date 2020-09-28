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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showSpinner()
        presenter?.attach(self)
        mapHandler?.attach(mapView)
        presenter?.viewDidLoad()
    }
    
    private func configureUI() {
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        mapView.clipsToBounds = true
        mapView.layer.cornerRadius = 8
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
    
}

extension LaunchpadInfoController: LaunchpadInfoPresenterOutput {
    func didReceiveLaunchpadInfoData(_ data: LaunchpadDatum) {
        mapHandler?.setData(data)
        DispatchQueue.main.async {
            self.title = data.name
        }
        removeSpinner()
    }
    
}
