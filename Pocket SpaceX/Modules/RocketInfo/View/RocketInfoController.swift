//
//  RocketInfoController.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketInfoController: SpinnerController {
    
    var presenter: RocketInfoPresenterInput?
    var tableView: UITableView!
    var tableHandler: RocketInfoTableHandlerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showSpinner()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        tableView = UITableView(frame: view.frame, style: .grouped)
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

extension RocketInfoController: RocketInfoPresenterOutput {
    func didReceiveRocketInfoData(_ data: RocketDatum) {
        DispatchQueue.main.async {
            self.title = data.name
        }
        tableHandler?.setData(data)
        removeSpinner()
    }
    
}
