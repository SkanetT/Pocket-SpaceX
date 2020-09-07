//
//  LaunchController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {

     var presenter: LaunchPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        presenter?.attach(self)
        presenter?.viewDidLoad()
    }
    
    private func configureUi() {
        view.backgroundColor = .white
        title = "SpaceX"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func handleMenu(){
        presenter?.sideMenuTap()
    }
    
}

extension LaunchController: LaunchPresenterOutput {
    
}
