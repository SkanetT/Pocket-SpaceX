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
    var allLaunchData: LaunchData = []
    var upcomingLaunchData: LaunchData = []
    var pastLaunchData: LaunchData = []
    var filteredLaunchData: LaunchData = []
    let size = UIScreen.main.bounds.height
    var userTap: ((LaunchDatum) -> ())?
    var isFilter = false
    var refreshControl = UIRefreshControl()
    var refresh: (() -> ())?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "LaunchCell", bundle: nil), forCellReuseIdentifier: "launchCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 130
        tableView.keyboardDismissMode = .onDrag
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
    }
    
    func setData(_ data: LaunchData) {
        allLaunchData = data
        upcomingLaunchData = data.filter( {$0.upcoming == true } )
        pastLaunchData = data.filter( {$0.upcoming == false } )
        self.launchData = allLaunchData
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
        allLaunchData.reverse()
        upcomingLaunchData.reverse()
        pastLaunchData.reverse()
        tableView?.scrollToRow(at: [0, 0], at: .top, animated: true)
        tableView?.reloadData()
    }
    
    func setTapAction(userTap: ((LaunchDatum) -> ())?) {
        self.userTap = userTap
    }
    
    func changeData(_ type: LaunchType) {
        switch type {
        case .all:
            launchData = allLaunchData
        case .upcoming:
            launchData = upcomingLaunchData
        case .past:
            launchData = pastLaunchData
        }
        tableView?.reloadData()
        tableView?.scrollToRow(at: [0, 0], at: .top, animated: true)
    }
    
    func setTapRefresh(refresh: (() -> ())?) {
        self.refresh = refresh
    }
    
    func scrollToNextLaucnh(id: String) {
        launchData = allLaunchData
        guard  let index = launchData.firstIndex(where: {$0.id == id}) else { return }
        tableView?.reloadData()
        tableView?.selectRow(at: [0, index], animated: true, scrollPosition: .middle)
    }
    
    
    @objc func refresh(_ sender: AnyObject) {
        refresh?()
        refreshControl.endRefreshing()
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
        tableView.deselectRow(at: indexPath, animated: true)
        if !isFilter {
            userTap?(launchData[indexPath.row])
        } else {
            userTap?(filteredLaunchData[indexPath.row])
        }
    }
    
}
