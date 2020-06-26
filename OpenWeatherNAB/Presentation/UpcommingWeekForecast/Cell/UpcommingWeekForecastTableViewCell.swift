//
//  WeatherListTableViewCell.swift
//  OpenWeatherNAB
//
//  Created by Luong Nghia on 6/20/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import UIKit

class UpcomingWeekForecastTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        addSupportAutoAjustment(dateLabel)
        addSupportAutoAjustment(tempatureLabel)
        addSupportAutoAjustment(pressureLabel)
        addSupportAutoAjustment(humidityLabel)
        addSupportAutoAjustment(descriptionLabel)
    }   
    
    func bind(_ viewModel: ForecastItemModel) {
        self.dateLabel.text = viewModel.dateToString()
        self.tempatureLabel.text = viewModel.tempartureToString()
        self.pressureLabel.text = viewModel.pressureToString()
        self.humidityLabel.text = viewModel.humitidyToString()
        self.descriptionLabel.text = viewModel.descriptionToString()
    }
}

extension UpcomingWeekForecastTableViewCell {
    private func addSupportAutoAjustment(_ label: UILabel) {
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
    }
}
