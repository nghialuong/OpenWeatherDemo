//
//  WeatherListTableViewCell.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit

class UpcomingWeekForecastTableViewCell: UITableViewCell {
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var tempatureValueLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var descriptionValueLabel: UILabel!
    
    func bind(_ viewModel: ForecastItemModel) {
        self.dateValueLabel.text = viewModel.dateToString()
        self.tempatureValueLabel.text = viewModel.tempartureToString()
        self.pressureValueLabel.text = viewModel.pressureToString()
        self.humidityValueLabel.text = viewModel.humitidyToString()
        self.descriptionValueLabel.text = viewModel.description
    }
    
}
