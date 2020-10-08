//
//  MenuController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var tableView: UITableView!
    weak var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenu()
    }
    
    func configureMenu(){
        tableView = UITableView()
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: MenuOptionCell.name)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeGesture.direction = .left
        view.addGestureRecognizer(swipeGesture)
        view.setGradientBackground(colorOne: .white, colorTwo: Colors.lowBlue)
    }
    
    @objc
    private func swipe() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuOptionCell.name, for: indexPath) as! MenuOptionCell
        
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

extension UITableViewCell {
    static var name: String {
        return String(describing: self)
    }
}
