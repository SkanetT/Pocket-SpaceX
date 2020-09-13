//
//  RocketInfoRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInfoRouting {
    func dismiss()
    func showError(_ error: ApiErrors)
    func needRefresh(refresh: (() -> ())?)
    func presentWiki(_ url: String)
}
