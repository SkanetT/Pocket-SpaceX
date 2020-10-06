//
//  RocketRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketRouting {
    func dismiss()
    func showError(_ error: ApiErrors)
    func repeatError()
    func removeError()
    func rocketInfoPresent(id: String)
    func needRefresh(refresh: (() -> ())?)
}
