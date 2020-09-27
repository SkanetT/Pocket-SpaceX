//
//  LaunchpadTableHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol LaunchpadTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: LaunchpadData)
    func setAction(userSelect: ((String) -> ())?)
}
