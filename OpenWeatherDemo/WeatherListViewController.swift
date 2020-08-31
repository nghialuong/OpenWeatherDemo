//
//  ViewController.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UpcommingWeekForecastViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: WeatherListViewModel!
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weather Forecast"
        configureTableView()
        configureSearchController()
        bindViewModel()
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureSearchController() {
        navigationItem.searchController = searchController
    }
    
    private func bindViewModel() {
        //        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
        //            .mapToVoid()
        //            .asDriverOnErrorJustComplete()
        let searchTrigger = searchController.searchBar.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count > 2 }
            .asDriverOnErrorJustComplete()
        
        let input = WeatherListViewModel.Input(searchTrigger: searchTrigger)
        let output = viewModel.transform(input: input)
        output.weatherInfo
            .drive(onNext: { item in
                print(item)
            })
            .disposed(by: disposeBag)
    }
}

extension UpcommingWeekForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as? WeatherListTableViewCell
        return cell ?? UITableViewCell()
    }
}

extension UpcommingWeekForecastViewController: UITableViewDelegate {}


