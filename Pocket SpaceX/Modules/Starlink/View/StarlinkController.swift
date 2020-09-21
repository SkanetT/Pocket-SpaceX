//
//  StarlinkController.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class StarlinkController: SpinnerController {
    
    var presenter: StarlinkPresenterInput?
    var tableView: UITableView!
    var tableHandler: StarlinkTableHandlerProtocol?
    var segmentedContoll: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        configureUI()
        segmentedContoll.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        tableHandler?.attach(tableView)
        showSpinner()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        title = "Starlink"
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        let segmentItems = ["All", "In space"]
        segmentedContoll = UISegmentedControl(items: segmentItems)
        segmentedContoll.selectedSegmentIndex = 0
        view.addSubview(segmentedContoll)
        segmentedContoll.snp.makeConstraints() { make in
            make.bottom.equalTo(view.snp.bottom).offset(-30)
            make.height.equalTo(30)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
    
    @objc
    private func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            presenter?.changeDataTap(true)
        case 1:
            presenter?.changeDataTap(false)
        default:
            break
        }
    }
}

extension StarlinkController: StarlinkPresenterOutput {
    func didReceiveStarlinkData(_ data: StarlinkData) {
        tableHandler?.setData(data)
        removeSpinner()
    }
    
    func setActionForWiki(_ userSelectWiki: (() -> ())?) {
        tableHandler?.setWikiAction(userTapWiki: userSelectWiki)
    }
    
    func setDataChange(_ type: Bool) {
        tableHandler?.changeData(type)
    }
}