//
//  RocketCollectionHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 09.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketCollectionHandler: NSObject, RocketCollectionHandlerProtocol {
    
    private weak var collectionView: UICollectionView?
    var rocketData: RocketData = []
    
    func attach(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(UINib(nibName: "rocketCell", bundle: nil), forCellWithReuseIdentifier: "rocketCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setData(_ data: RocketData) {
        self.rocketData = data
        collectionView?.reloadData()
    }
}

extension RocketCollectionHandler: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocketData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rocketCell", for: indexPath) as! RocketCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = (screenSize.width / 2) - 18
        return CGSize(width: screenWidth, height: screenWidth * 0.5)
    }
}
