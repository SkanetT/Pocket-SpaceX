//
//  LaunchpadTableHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchpadTableHandler: NSObject, LaunchpadTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    var data: LaunchpadData = []
    var userSelectCell: ((String) -> ())?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "LaunchpadCell", bundle: nil), forCellReuseIdentifier: "launchpadCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 65
    }
    
    func setData(_ data: LaunchpadData) {
        self.data = data
        self.tableView?.reloadData()
    }
    
    func setAction(userSelect: ((String) -> ())?) {
        self.userSelectCell = userSelect
    }
}

extension LaunchpadTableHandler: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launchpadCell", for: indexPath) as! LaunchpadCell
        cell.setData(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelectCell?(data[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
