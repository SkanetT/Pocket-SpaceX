//
//  LaunchpadController.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchpadController: SpinnerController {
    
    var presenter: LaunchpadPresenterInput?
    var tableHandler: LaunchpadTableHandlerProtocol?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        configureUI()
        tableHandler?.attach(tableView)
        showSpinner()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = "Launchpads"
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
    
}

extension LaunchpadController: LaunchpadPresenterOutput {
    func didReceiveLaucnhpadData(_ data: LaunchpadData) {
        tableHandler?.setData(data)
        removeSpinner()
    }
    
    func setActionForCell(_ userSelect: ((String) -> ())?) {
        tableHandler?.setAction(userSelect: userSelect)
    }
    
}
