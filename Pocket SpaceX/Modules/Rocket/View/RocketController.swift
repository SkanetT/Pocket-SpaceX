//
//  RocketController.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketController: SpinnerController {
    
    var collectionView: UICollectionView!
    var presenter: RocketPresenterInput?
    var collectionHandler: RocketCollectionHandlerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        collectionHandler?.attach(collectionView)
    }
    
    @objc
    private func exitTap() {
        presenter?.closeTap()
    }
    
}

extension RocketController: RocketPresenterOutput {
    func configureUI() {
        
        title = "Rockets"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(exitTap))
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        showSpinner()
    }
    
    func setActionForCell(_ userSelect: ((String) -> ())?) {
        collectionHandler?.setAction(userSelect: userSelect)
    }
    
    func didReceiveRocketData(_ data: RocketData) {
        collectionHandler?.setData(data)
        removeSpinner()
    }
}

