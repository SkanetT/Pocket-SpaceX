//
//  StarlinkTableHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 18.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol StarlinkTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: StarlinkData)
}
