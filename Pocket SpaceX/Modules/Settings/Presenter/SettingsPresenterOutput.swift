//
//  SettingsPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol SettingsPresenterOutput: class {
    func didReceiveVideoStatus(_ status: Bool)
    func didReceiveInfoText(_ info: String)
}