//
//  LaunchController.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchController: SpinnerController {
    
    var presenter: LaunchPresenterInput?
    let searchController = UISearchController(searchResultsController: nil)
    var tableView: UITableView!
    var tableHandler: LaunchTableHandlerProtocol?
    var searchHandler: LaunchSearchHandlerProtocol?
    var isReverse = false
    var segmentedContoll: UISegmentedControl!
    var nextButton: LoadingButton!
    var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(self)
        presenter?.viewDidLoad()
        tableHandler?.attach(tableView)
        searchHandler?.attach(searchController)
        searchHandler?.setSearch() { [weak self] text in
            self?.tableHandler?.searchReload(text)
        }
        tableHandler?.setTapRefresh() { [weak self] () in
            self?.presenter?.refreshData()
            self?.showSpinner()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchController.searchBar.endEditing(true)
    }
    
    @objc
    private func handleMenu() {
        presenter?.sideMenuTap()
    }
    
    @objc
    private func swipe() {
        presenter?.sideMenuTap()
    }
    
    @objc
    private func handleReverse() {
        presenter?.reverseTap()
    }
    
    @objc
    private func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            presenter?.launchTypeChange(.all)
        case 1:
            presenter?.launchTypeChange(.upcoming)
        case 2:
            presenter?.launchTypeChange(.past)
        default:
            break
        }
    }
    
    @objc
    private func handleNext() {
        nextButton.isLoading = true
        nextButton.isUserInteractionEnabled = false
        searchController.searchBar.text = nil
        presenter?.nextLaunchTap()
    }
    
}

extension LaunchController: LaunchPresenterOutput {
    
    func configureUI() {
        
        title = "Launches"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up"), style: .plain, target: self, action: #selector(handleReverse))
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        swipeView = UIView()
        view.addSubview(swipeView)
        view.bringSubviewToFront(swipeView)
        swipeView.backgroundColor = .none
        swipeView.snp.makeConstraints() { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(UIScreen.main.bounds.width / 20)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeGestureRight.direction = .right
        swipeView.addGestureRecognizer(swipeGestureRight)
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeGestureLeft.direction = .left
        swipeView.addGestureRecognizer(swipeGestureLeft)
        
        showSpinner()
    }
    
    func configureSegmentedContoll() {
        
        let segmentItems = ["All", "Upcomming", "Past"]
        segmentedContoll = UISegmentedControl(items: segmentItems)
        segmentedContoll.selectedSegmentIndex = 0
        view.addSubview(segmentedContoll)
        segmentedContoll.snp.makeConstraints() { make in
            make.bottom.equalTo(view.snp.bottomMargin).offset(-8)
            make.height.equalTo(UIScreen.main.bounds.height / 22)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        segmentedContoll.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        segmentedContoll.layer.masksToBounds = false
        segmentedContoll.layer.shadowColor = UIColor.black.cgColor
        segmentedContoll.layer.shadowOpacity = 0.35
        segmentedContoll.layer.shadowOffset = .init(width: 5, height: 7)
        segmentedContoll.layer.shadowRadius = 10
        
    }
    
    func configureNextButton() {
        
        nextButton = LoadingButton()
        nextButton.configureButton(title: "Next launch")
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints() { make in
            make.bottom.equalTo(segmentedContoll.snp.top).offset(-4)
            make.height.equalTo(UIScreen.main.bounds.height / 22)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
    }
    
    func didReceiveLaunchData(_ data: LaunchData) {
        isReverse = false
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "arrow.up")
            self.segmentedContoll.selectedSegmentIndex = 0
        }
        removeSpinner()
        tableHandler?.setData(data)
    }
    
    func didReceiveNextLaunchId(_ id: String) {
        DispatchQueue.main.async {
            self.segmentedContoll.selectedSegmentIndex = 0
            self.nextButton.isLoading = false
            self.nextButton.isUserInteractionEnabled = true
            self.tableHandler?.scrollToNextLaucnh(id: id)
        }
    }
    
    func didReceiveNextLaunchError() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.nextButton.isUserInteractionEnabled = true
            self.nextButton.failureAction(title: "Next launch")
        }
    }
    
    func needToReverse() {
        isReverse.toggle()
        if isReverse {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "arrow.down")
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "arrow.up")
        }
        tableHandler?.reverseData()
    }
    
    func setActionForCell(_ userSelect: ((LaunchDatum) -> ())?) {
        tableHandler?.setTapAction(userTap: userSelect)
    }
    
    func typeChange(_ type: LaunchType) {
        searchController.searchBar.text = nil
        
        tableHandler?.changeData(type)
    }
    
}
