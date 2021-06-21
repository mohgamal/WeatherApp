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
        // Initialization code
    }
    
    func configCell(with weather: CityWeatherEntity.ConsolidatedWeatherEntity?) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: weather?.applicable_date ?? "") ?? nil
        let weekday = Calendar.current.component(.weekday, from: date ?? Date())
        

        
        self.dayNameLabel.text = Calendar.current.weekdaySymbols[weekday]
        
        
        self.degreeLabel.text = "\(Int(weather?.the_temp ?? 0))°C"
        
        ImageDownloader.shared.downloadImage(with: "https://www.metaweather.com/static/img/weather/png/64/\(weather?.weather_state_abbr ?? "").png", completionHandler: { (image, result) in
            self.statusImage.image = image
        }, placeholderImage: UIImage(named: "default-image"))
        
        self.statusImage.contentMode = .scaleToFill
    }
    
    func getTodayWeekDay(date: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.date(from: date)
        return weekDay?.description ?? ""
    }
    
}
