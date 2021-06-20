//
//  CityWeatherInteractor.swift
//  WeatherAppDomain
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation

public protocol CityWeatherInteractorInterface {
    func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherEntity, WeatherAppError>) -> Void)
}

public class CityWeatherInteractor: CityWeatherInteractorInterface {
    
    var cityWeatherDomainRepo: CityWeatherDomainRepoInterface
    
    public init (cityWeatherDomainRepo: CityWeatherDomainRepoInterface) {
        self.cityWeatherDomainRepo = cityWeatherDomainRepo
    }
    
    public func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherEntity, WeatherAppError>) -> Void) {
        cityWeatherDomainRepo.getCityWeather(by: woeid) { cityWeatherDomainModel in
            handler(cityWeatherDomainModel)
        }
    }
}
