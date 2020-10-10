//
//  SettingsInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol SettingsInteractorInput: InteractorInput {
    func attach(_ output: SettingsInteractorOutput)
    func fetchVideoStatus()
    func changeVideoStatus(_ status: Bool)
    func fetchInfoText()
    func deleteKFCache()
}
