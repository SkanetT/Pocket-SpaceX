//
//  FooterInfoCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 12.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class FooterInfoCell: UIView {
    
    var button = UIButton(type: .system)
    var select: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
        button.configureButton(title: "Wikipedia")
        
        button.snp.makeConstraints() { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(20)
            make.trailing.equalTo(snp.trailing).offset(-20)
            make.bottom.equalTo(snp.bottom).offset(-10)

        }
        backgroundColor = .none
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func tap() {
        select?()
    }
}
 
