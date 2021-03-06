//
//  SettingsInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol SettingsInteractorOutput: InteractorOutput {
    func videoStatusSuccess(_ status: Bool)
    func infoTextSuccess(version: String, build: String)
    func deleteCacheSuccess()
}
