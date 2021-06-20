//
//  CityWeatherDomainRepoInterface.swift
//  WeatherAppDomain
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation

public protocol CityWeatherDomainRepoInterface {
    func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherEntity, WeatherAppError>) -> Void)
}
