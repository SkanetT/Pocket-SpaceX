//
//  LaunchSearchHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol LaunchSearchHandlerProtocol {
    func attach(_ searchController: UISearchController)
    func setSearch(search: ((String) -> ())?)

}
