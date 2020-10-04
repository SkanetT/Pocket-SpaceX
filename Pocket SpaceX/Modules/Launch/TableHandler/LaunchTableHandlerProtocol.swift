//
//  LaunchTableHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol LaunchTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: LaunchData)
    func reverseData()
    func changeData(_ type: LaunchType)
    func searchReload(_ search: String)
    func setTapAction(userTap: ((LaunchDatum) -> ())?)
    func setTapRefresh(refresh: (() -> ())?)
    func scrollToNextLaucnh(id: String)
}
