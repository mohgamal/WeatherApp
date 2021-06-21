//
//  CityWeatherView.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import UIKit

class CityWeatherView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    func updateUI() {
        let gradientLayer = Utils().generateGradientLayer()
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}
