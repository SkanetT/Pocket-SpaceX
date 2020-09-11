//
//  RocketCollectionHandlerProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 09.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol RocketCollectionHandlerProtocol {
    func attach(_ collectionView: UICollectionView)
    func setData(_ data: RocketData)
    func setAction(userSelect: ((String) -> ())?)
}
