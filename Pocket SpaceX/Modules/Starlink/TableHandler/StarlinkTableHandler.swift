//
//  StarlinkTableHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 18.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class StarlinkTableHandler: NSObject, StarlinkTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    var fullData: StarlinkData = []
    var spaceOnlyData: StarlinkData = []
    var isFull = true
    var userTapWiki: (() -> ())?
    
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "StarlinkCell", bundle: nil), forCellReuseIdentifier: "starlink")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 165
    }
    
    func setData(_ data: StarlinkData) {
        self.fullData = data
        self.spaceOnlyData = data.filter( {$0.heightKM != nil} )
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func changeData(_ isFull: Bool) {
        self.isFull = isFull
        DispatchQueue.main.async {
            self.tableView?.reloadData()
            self.tableView?.scrollToRow(at: [0, 0], at: .top, animated: true)
        }
    }
    
    func setWikiAction(userTapWiki: (() -> ())?) {
        self.userTapWiki = userTapWiki
    }
    
}

extension StarlinkTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFull {
            return fullData.count
        } else {
            return spaceOnlyData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starlink", for: indexPath) as! StarlinkCell
        if isFull {
            cell.setData(fullData[indexPath.row])
        } else {
            cell.setData(spaceOnlyData[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 250
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = HeaderStarlinkCell()
        header.setData(all: fullData.count, inSpace: spaceOnlyData.count)
        header.select = {
            self.userTapWiki?()
        }
        
        return header
    }
    
}
