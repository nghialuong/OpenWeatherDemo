//
//  ViewController.swift
//  OpenWeatherDemo
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UpcomingWeekForecastViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: UpcomingWeekForecastViewModel!
    let disposeBag = DisposeBag()
    
    var errorBinding: Binder<ApiError> {
        return Binder(self, binding: { (vc, error) in
            let alert = UIAlertController(title: error.description,
                                          message: nil,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss",
                                       style: UIAlertAction.Style.cancel,
                                       handler: nil)
            alert.addAction(action)
            vc.present(alert, animated: true, completion: nil)
        })
    }
    
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
        let searchTextChanged = searchController.searchBar.rx.text.orEmpty
            .skip(1)
        let searchTrigger = searchTextChanged
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map { $0.replacingOccurrences(of: " ", with: "") }
            .filter { $0.count > 2 }
            .asDriverOnErrorJustComplete()
        let clearSearchTrigger = searchTextChanged
        
        let input = UpcomingWeekForecastViewModel.Input(searchTrigger: searchTrigger, clearSearchTrigger: clearSearchTrigger.asDriverOnErrorJustComplete())
        let output = viewModel.transform(input: input)
        
        output.upcomingWeekForecast
            .drive(tableView.rx.items(cellIdentifier: "UpcomingWeekForecastCell", cellType: UpcomingWeekForecastTableViewCell.self))({ _, viewModel, cell in
                cell.bind(viewModel)
            })
            .disposed(by: disposeBag)
        
        output.error
            .drive(errorBinding)
            .disposed(by: disposeBag)
    }
}



