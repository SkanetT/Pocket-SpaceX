//
//  SettingsPresenterInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol SettingsPresenterInput: PresenterInput {
    func attach(_ viewController: SettingsPresenterOutput)
    func dismissRequest()
    func clearTap()
    func videoSettingsChange(_ status: Bool)
}
