//
//  RocketController.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    var presenter: RocketPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.attach(self)
        configureUI()
    }
    
    private func configureUI() {
        title = "Rockets"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
    
}

extension RocketController: RocketPresenterOutput {
    
}
