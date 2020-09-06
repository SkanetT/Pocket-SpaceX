//
//  MenuDelegate.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol MenuDelegate: class {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}
