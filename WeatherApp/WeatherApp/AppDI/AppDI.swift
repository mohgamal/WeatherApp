//
//  AppDI.swift
//  WeatherApp
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import WeatherAppPresentation

class AppDI: AppDIInterface {
   
    static let shared = AppDI(appEnvironment: AppEnvironment())
    
    let appEnvironment: AppEnvironment
    
    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func cityWeatherDependencies() -> CityWeatherVM {
        let cityWeatherDI = CityWeatherDI(appEnvironment: appEnvironment)
        return cityWeatherDI.cityWeatherDependencies()
    }
}
