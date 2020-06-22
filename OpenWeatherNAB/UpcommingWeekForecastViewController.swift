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
    @IBOutlet weak var tableView: UITableView!
    var viewModel: UpcommingWeekForecastViewModel!
    let disposeBag = DisposeBag()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "City name"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
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
        let searchTrigger = searchController.searchBar.rx.text.orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count > 2 }
            .asDriverOnErrorJustComplete()
        
        let input = UpcommingWeekForecastViewModel.Input(searchTrigger: searchTrigger)
        let output = viewModel.transform(input: input)
        
        output.upcommingWeekForecast
            .drive(tableView.rx.items(cellIdentifier: "UpcommingWeekForecastCell", cellType: UpcommingWeekForecastTableViewCell.self))({ _, viewModel, cell in
                cell.bind(viewModel)
            })
            .disposed(by: disposeBag)
    }
}



