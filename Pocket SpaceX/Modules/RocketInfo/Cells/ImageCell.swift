//
//  ImageCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        image.snp.makeConstraints() { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
        
        image.contentMode = .scaleAspectFill

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
