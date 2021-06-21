//
//  CityCell.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import UIKit
import WeatherAppDomain

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    
    static let cellIdentifier = "weatherCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(with weather: CityWeatherEntity.ConsolidatedWeatherEntity?) {
        self.dayNameLabel.text = Utils.getWeekDay(from: weather?.applicable_date ?? "")
        self.degreeLabel.text = "\(Int(weather?.the_temp ?? 0))°C"
        ImageDownloader.shared.downloadImage(with: "https://www.metaweather.com/static/img/weather/png/64/\(weather?.weather_state_abbr ?? "").png", completionHandler: { (image, result) in
            DispatchQueue.main.async {
                self.statusImage.image = image
                self.statusImage.contentMode = .scaleToFill
            }
        }, placeholderImage: UIImage(named: "default-image"))
    }
}
