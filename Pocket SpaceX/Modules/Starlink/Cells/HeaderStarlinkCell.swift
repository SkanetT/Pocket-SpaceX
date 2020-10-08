//
//  HeaderStarlinkCell.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class HeaderStarlinkCell: UIView {

    var select: (() -> ())?
    var starlinkIcon = UIImageView()
    var totalLabel = UILabel()
    var totalLabelCount = UILabel()
    var spaceLabel = UILabel()
    var spaceLabelCount = UILabel()
    var deorbitedLabel = UILabel()
    var deorbitedLabelCount = UILabel()
    var button = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(starlinkIcon)
        starlinkIcon.image = #imageLiteral(resourceName: "Starlink")
        starlinkIcon.contentMode = .scaleAspectFit
        starlinkIcon.snp.makeConstraints() { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(100)
        }
        
        addSubview(totalLabel)
        totalLabel.font = totalLabel.font.withSize(22)
        totalLabel.adjustsFontSizeToFitWidth = true
        totalLabel.minimumScaleFactor = 0.5
        totalLabel.textAlignment = .center
        totalLabel.snp.makeConstraints() { make in
            make.top.equalTo(starlinkIcon.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
        }
        addSubview(totalLabelCount)
        totalLabelCount.font = totalLabelCount.font.withSize(22)
        totalLabelCount.textAlignment = .center
        totalLabelCount.snp.makeConstraints() { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(8)
            make.leading.equalTo(totalLabel.snp.leading)
            make.trailing.equalTo(totalLabel.snp.trailing)
        }
        addSubview(spaceLabel)
        spaceLabel.font = spaceLabel.font.withSize(22)
        spaceLabel.adjustsFontSizeToFitWidth = true
        spaceLabel.minimumScaleFactor = 0.5
        spaceLabel.textAlignment = .center
        spaceLabel.snp.makeConstraints() { make in
            make.top.equalTo(totalLabelCount.snp.bottom).offset(8)
            make.leading.equalTo(totalLabel.snp.leading)
            make.trailing.equalTo(totalLabel.snp.trailing)
        }
        addSubview(spaceLabelCount)
        spaceLabelCount.font = spaceLabelCount.font.withSize(22)
        spaceLabelCount.textAlignment = .center
        spaceLabelCount.textColor = Colors.green
        spaceLabelCount.snp.makeConstraints() { make in
            make.top.equalTo(spaceLabel.snp.bottom).offset(8)
            make.leading.equalTo(totalLabel.snp.leading)
            make.trailing.equalTo(totalLabel.snp.trailing)
        }
        addSubview(deorbitedLabel)
        deorbitedLabel.font = deorbitedLabel.font.withSize(22)
        deorbitedLabel.adjustsFontSizeToFitWidth = true
        deorbitedLabel.minimumScaleFactor = 0.5
        deorbitedLabel.textAlignment = .center
        deorbitedLabel.snp.makeConstraints() { make in
            make.top.equalTo(spaceLabelCount.snp.bottom).offset(8)
            make.leading.equalTo(totalLabel.snp.leading)
            make.trailing.equalTo(totalLabel.snp.trailing)
        }
        addSubview(deorbitedLabelCount)
        deorbitedLabelCount.font = deorbitedLabelCount.font.withSize(22)
        deorbitedLabelCount.textAlignment = .center
        deorbitedLabelCount.textColor = Colors.red
        deorbitedLabelCount.snp.makeConstraints() { make in
            make.top.equalTo(deorbitedLabel.snp.bottom).offset(8)
            make.leading.equalTo(totalLabel.snp.leading)
            make.trailing.equalTo(totalLabel.snp.trailing)
        }
        addSubview(button)
        button.configureButton(title: "Wikipedia")
        
        button.snp.makeConstraints() { make in
            make.top.equalTo(deorbitedLabelCount.snp.bottom).offset(8)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(30)
            
        }
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(all: Int, inSpace: Int) {
        totalLabel.text = "Total satellites launched: "
        totalLabelCount.text = all.description
        spaceLabel.text = "Satellites in space: "
        spaceLabelCount.text = inSpace.description
        deorbitedLabel.text = "Deorbited satellites: "
        deorbitedLabelCount.text = (all - inSpace).description
    }
    
    
    @objc
    private func tap() {
        select?()
    }
    
}
