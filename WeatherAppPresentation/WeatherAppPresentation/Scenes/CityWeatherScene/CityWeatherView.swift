//
//  CityWeatherView.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import UIKit
import Combine

public class CityWeatherView: UIViewController {
    
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
        let gradientLayer = Utils().generateGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    private func bindViewModel() {
        cityWeatherVM.objectWillChange.sink { [weak self] in
            guard let self = self else {
                return
            }
            
            self.spinner.stopAnimating()
            
            if self.cityWeatherVM.error != nil {
                self.viewAlert(with: self.cityWeatherVM.error)
            } else {
               
            }
            
        }.store(in: &cancellables)
    }
    
    private func viewAlert(with error: Error?) {
        let alert = UIAlertController(title: "Error Occured", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
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
