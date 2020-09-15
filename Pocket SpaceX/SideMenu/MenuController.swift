//
//  MenuController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuController: UIViewController {
    
    var tableView: UITableView!
    weak var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenu()
    }
    
    func configureMenu(){
        tableView = UITableView()
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        
        cell.selectionStyle = .none
        
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}
