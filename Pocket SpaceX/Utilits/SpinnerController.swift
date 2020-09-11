//
//  SpinnerController.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SpinnerController: UIViewController {
    
    let aView = UIView()
    let smallView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        aView.backgroundColor = .white
        view.addSubview(aView)
        
        aView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        aView.isHidden = true
        
        let size = UIScreen.main.bounds.height / 8.5

        smallView.backgroundColor = .lightGray
        smallView.clipsToBounds = true
        smallView.layer.cornerRadius = size / 4
        aView.addSubview(smallView)
        
        smallView.snp.makeConstraints() { make in
            make.centerY.equalTo(aView.snp.centerY)
            make.centerX.equalTo(aView.snp.centerX)
            make.height.width.equalTo(size)
        }

        
        let ai = UIActivityIndicatorView(style: .medium)
        smallView.addSubview(ai)
        
        ai.isHidden = false
        
        ai.snp.makeConstraints() { make in
            make.centerY.equalTo(smallView.snp.centerY)
            make.centerX.equalTo(smallView.snp.centerX)
        }
        
        ai.startAnimating()
    }
    func showSpinner() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.aView)
            self.aView.isHidden = false
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.aView.isHidden = true
        }
    }
}
