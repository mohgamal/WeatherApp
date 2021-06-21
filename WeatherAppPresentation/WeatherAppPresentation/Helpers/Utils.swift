//
//  Utils.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import UIKit

final public class Utils {
    
    init() { }
    
    func generateGradientLayer() -> CAGradientLayer {
        let colorTop =  UIColor(red: 48.0/255.0, green: 162.0/255.0, blue: 197.0/255.0, alpha: 1.0).cgColor        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        
        return gradientLayer
    }
}
