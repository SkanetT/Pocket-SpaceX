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

    
    func attach(_ tableView: UITableView) {
        
    }
    
    func setData(_ data: StarlinkData) {
        self.fullData = data
        self.spaceOnlyData = data.filter( {$0.heightKM != nil} )
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
}
