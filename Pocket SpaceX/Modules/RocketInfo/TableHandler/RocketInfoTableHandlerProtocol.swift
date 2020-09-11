//
//  RocketInfoTableHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol RocketInfoTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: RocketDatum)
}

