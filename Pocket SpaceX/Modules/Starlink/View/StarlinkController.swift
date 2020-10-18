//
//  StarlinkController.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class StarlinkController: SpinnerController {
    
    var presenter: StarlinkPresenterInput?
    var tableView: UITableView!
    var tableHandler: StarlinkTableHandlerProtocol?
    var segmentedContol: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
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
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        title = "Starlink"
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        let segmentItems = ["All", "In space"]
        segmentedContol = UISegmentedControl(items: segmentItems)
        segmentedContol.selectedSegmentIndex = 0
        segmentedContol.backgroundColor = UIColor.white
        segmentedContol.selectedSegmentTintColor = UIColor.white
        view.addSubview(segmentedContol)
        segmentedContol.snp.makeConstraints() { make in
            make.bottom.equalTo(view.snp.bottom).offset(-30)
            make.height.equalTo(UIScreen.main.bounds.height / 22)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        segmentedContol.setShadow(color: .black)
        segmentedContol.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        
        showSpinner()
    }
    
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
