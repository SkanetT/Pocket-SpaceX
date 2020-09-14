//
//  LaunchController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchController: SpinnerController {
    
    var presenter: LaunchPresenterInput?
    let searchController = UISearchController(searchResultsController: nil)
    var tableView: UITableView!
    var tableHandler: LaunchTableHandlerProtocol?
    var searchHandler: LaunchSearchHandlerProtocol?
    var isReverse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        showSpinner()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
        searchHandler?.attach(searchController)
        searchHandler?.setSearch() { [weak self] text in
            self?.tableHandler?.searchReload(text)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchController.searchBar.endEditing(true)
    }
    
    
    private func configureUi() {
        title = "Launches"
        navigationController?.navigationBar.prefersLargeTitles = true
      //  navigationItem.hidesSearchBarWhenScrolling = false
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up"), style: .plain, target: self, action: #selector(handleReverse))
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
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
    private func handleMenu() {
        presenter?.sideMenuTap()
    }
    
    @objc
    private func handleReverse() {
        presenter?.reverseTap()
    }
    
}

extension LaunchController: LaunchPresenterOutput {
    
    func didReceiveLaunchData(_ data: LaunchData) {
        removeSpinner()
        tableHandler?.setData(data)
    }
    
    func needToReverse() {
        isReverse.toggle()
        if isReverse {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "arrow.down")
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "arrow.up")
        }
        tableHandler?.reverseData()
    }
    
    func setActionForCell(_ userSelect: ((LaunchDatum) -> ())?) {
        tableHandler?.setTapAction(userTap: userSelect)
    }
    
}
