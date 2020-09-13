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
    let size = UIScreen.main.bounds.height

    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "RocketInfoCell", bundle: nil), forCellReuseIdentifier: "rocketInfoCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = size / 20
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rocketInfoCell", for: indexPath) as! RocketInfoCell
        if indexPath.row == 1 {
        cell.nameOptionLabel.text = "Country"
        cell.optionLabel.text = rocketInfoData?.country
        } else {
            cell.nameOptionLabel.text = "Mass"
            cell.optionLabel.text = rocketInfoData?.mass.kg.description
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderInfoCell()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return size / 3.5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = FooterInfoCell()
        footer.select = { 
            print(self.rocketInfoData?.wikipedia)
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return size / 10
        
    }
    
}
