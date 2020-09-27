//
//  LaunchpadInfoController.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchpadInfoController: SpinnerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showSpinner()
    }
    
    private func configureUI() {
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
    }
    
    @objc
    private func exitTap() {
        //      presenter?.closeTap()
    }
    
}
