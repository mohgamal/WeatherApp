//
//  CityWeatherView.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import UIKit
import Combine

public class CityWeatherView: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var windStatusLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var humadityLabel: UILabel!
    @IBOutlet weak var airPressureLabel: UILabel!
    @IBOutlet weak var newxtDaysView: UIView!
    @IBOutlet weak var dgreeStatusView: UIView!
    @IBOutlet weak var nextDaysCollectionView: UICollectionView!
    
    
    
    public let cityWeatherVM: CityWeatherVM
    private var cancellable: AnyCancellable?
    
    private var cancellables: Set<AnyCancellable> = []
    
    var appDI: AppDIInterface
    public var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    public init(appDI: AppDIInterface, cityWeatherVM: CityWeatherVM) {
        self.appDI = appDI
        self.cityWeatherVM = cityWeatherVM
        super.init(nibName: "CityWeatherView", bundle: Bundle(for: CityWeatherView.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        bindViewModel()
    }
    
    
    func updateUI() {
        addSpinner()
        spinner.startAnimating()
        self.dgreeStatusView.layer.cornerRadius = self.dgreeStatusView.frame.width / 2
        let gradientLayer = Utils().generateGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
        self.containerView.backgroundColor = UIColor.clear
        
        self.newxtDaysView.roundCorners(corners: [.topLeft, .topRight], radius: 40)
        
        self.nextDaysCollectionView.dataSource = self
        self.nextDaysCollectionView.delegate = self
        
        self.nextDaysCollectionView.register(UINib(nibName: "WeatherCell", bundle: Bundle(for: WeatherCell.self)), forCellWithReuseIdentifier: WeatherCell.cellIdentifier)

    }
    
    private func bindViewModel() {
        self.cityWeatherVM.getCityWeatherData(by: 839722)
        cityWeatherVM.objectWillChange.sink { [weak self] in
            guard let self = self else {
                return
            }
            
            self.spinner.stopAnimating()
            
            if self.cityWeatherVM.error != nil {
                self.viewAlert(with: self.cityWeatherVM.error)
            } else {
                self.updateUIElements()
            }
            
        }.store(in: &cancellables)
    }
    
    private func viewAlert(with error: Error?) {
        let alert = UIAlertController(title: "Error Occured", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func updateUIElements() {
        
        if let cityWeatherEntity = cityWeatherVM.cityWeatherResultEntity {
            self.dateLabel.text = cityWeatherEntity.time
            self.cityNameLabel.text = cityWeatherEntity.title
            self.degreeLabel.text = "\(Int(cityWeatherEntity.consolidated_weather?[0].the_temp ?? 0))°C"
            self.visibilityLabel.text = "\(Int(cityWeatherEntity.consolidated_weather?[0].visibility ?? 0)) miles"
            self.humadityLabel.text = "\(Int(cityWeatherEntity.consolidated_weather?[0].humidity ?? 0)) %"
            self.windStatusLabel.text = "\(Int(cityWeatherEntity.consolidated_weather?[0].wind_speed ?? 0)) mph"
            self.airPressureLabel.text = "\(Int(cityWeatherEntity.consolidated_weather?[0].air_pressure ?? 0)) mb"
            
            ImageDownloader.shared.downloadImage(with: "https://www.metaweather.com/static/img/weather/png/64/\(cityWeatherEntity.consolidated_weather?[0].weather_state_abbr ?? "").png", completionHandler: { (image, result) in
                self.statusImage.image = image
            }, placeholderImage: UIImage(named: "default-image"))
            
            self.statusImage.contentMode = .scaleToFill
            self.nextDaysCollectionView.reloadData()
        }
    }
    
    public func addSpinner() {
        spinner.color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
