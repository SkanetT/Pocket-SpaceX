//
//  LaunchSearchHandler.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class LaunchSearchHandler: NSObject, LaunchSearchHandlerProtocol {
    
    private weak var searchController: UISearchController?
    var search: ((String) -> ())?

    func attach(_ searchController: UISearchController) {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search launch"
        self.searchController = searchController
    }
    
    func setSearch(search: ((String) -> ())?) {
        self.search = search
    }
}

extension LaunchSearchHandler: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        search?(text)
    }
}
