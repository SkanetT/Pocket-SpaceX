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
    var userTapWiki: ((String) -> ())?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "RocketInfoCell", bundle: nil), forCellReuseIdentifier: "rocketInfoCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = size / 20
    }
    
    func setData(_ data: RocketDatum) {
        self.rocketInfoData = data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func setWikiAction(userTapWiki: ((String) -> ())?) {
        self.userTapWiki = userTapWiki
    }
    
}

extension RocketInfoTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rocketInfoCell", for: indexPath) as! RocketInfoCell
        
        guard let data = rocketInfoData else { return cell }
        guard let rocketInfoOption = RocketInfoOption(rawValue: indexPath.row) else { return cell }

        
        let dic = DataManager.shared.createDataForRockerInfo(data)
        
        cell.nameOptionLabel.text = rocketInfoOption.description
        if let option = dic.first(where: { $0.key == rocketInfoOption.description})?.value {
            cell.optionLabel.text = option
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderInfoCell()
        guard let data = rocketInfoData else { return nil }
        header.setData(data)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return size / 1.75
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let data = rocketInfoData else { return nil }
        let footer = FooterInfoCell()
        footer.select = { 
            self.userTapWiki?(data.wikipedia)
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return size / 10
        
    }
    
}
