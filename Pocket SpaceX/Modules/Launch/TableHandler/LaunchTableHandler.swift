//
//  LaunchTableHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchTableHandler: NSObject, LaunchTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    var launchData: LaunchData = []
    var filteredLaunchData: LaunchData = []
    let size = UIScreen.main.bounds.height
    var userTap: ((LaunchDatum) -> ())?
    var isFilter = false
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "LaunchCell", bundle: nil), forCellReuseIdentifier: "launchCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 130
        tableView.keyboardDismissMode = .onDrag
//        tableView.rowHeight = size / 6
    }
    
    func setData(_ data: LaunchData) {
        self.launchData = data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func searchReload(_ search: String) {
        guard search != "" else {
            isFilter = false
            tableView?.reloadData()
            return
        }
        filteredLaunchData = launchData.filter( {$0.name.lowercased().contains(search.lowercased())} )
        isFilter = true
        tableView?.reloadData()
    }
    
    func reverseData() {
        launchData.reverse()
        tableView?.reloadData()
    }
    
    func setTapAction(userTap: ((LaunchDatum) -> ())?) {
        self.userTap = userTap
    }
    
    
}

extension LaunchTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !isFilter {
            return launchData.count
        } else {
            return filteredLaunchData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "launchCell", for: indexPath) as! LaunchCell
        cell.patchImage.image = UIImage(systemName: "xmark.seal")
        if !isFilter {
            cell.setData(launchData[indexPath.row])
        } else {
            cell.setData(filteredLaunchData[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isFilter {
           userTap?(launchData[indexPath.row])
        } else {
            userTap?(filteredLaunchData[indexPath.row])
        }
    }
    
}
