//
//  RocketInfoTableHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketInfoTableHandler: NSObject, RocketInfoTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    var rocketInfoData: RocketDatum?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "", bundle: nil), forCellReuseIdentifier: "")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setData(_ data: RocketDatum) {
        self.rocketInfoData = data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}

extension RocketInfoTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
}
