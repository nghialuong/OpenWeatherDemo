//
//  ViewController.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weather Forecast"
        configureTableView()
        configureSearchController()
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureSearchController() {
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as? WeatherListTableViewCell
        return cell ?? UITableViewCell()
    }
}

extension WeatherListViewController: UITableViewDelegate {}


