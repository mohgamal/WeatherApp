//
//  CItyWeatherDI.swift
//  WeatherApp
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import WeatherAppDomain
import WeatherAppData
import WeatherAppPresentation

class CityWeatherDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    func cityWeatherDependencies() -> CityWeatherVM {

        let cityWeatherRemoteDataSource = CityWeatherRemoteDataSource(urlString: "\(appEnvironment.baseURL)\(appEnvironment.getCityByWoeidURL)")
        
        let cityWeatherDataRepo = CityWeatherDataRepo(cityWeatherRemoteDataSource: cityWeatherRemoteDataSource)

        let cityWeatherInteracrtor = CityWeatherInteractor(cityWeatherDomainRepo: cityWeatherDataRepo)

        let cityWeatherVM = CityWeatherVM(cityWeatherInteractor: cityWeatherInteracrtor)

        return cityWeatherVM
    }
}
