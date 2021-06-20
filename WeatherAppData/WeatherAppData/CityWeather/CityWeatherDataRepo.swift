//
//  CityWeatherDataRepo.swift
//  WeatherAppData
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation
import WeatherAppDomain

public class CityWeatherDataRepo: CityWeatherDomainRepoInterface {
    
    let cityWeatherRemoteDataSource: CityWeatherRemoteDataSourceInterface
    
    public init (cityWeatherRemoteDataSource: CityWeatherRemoteDataSourceInterface) {
        self.cityWeatherRemoteDataSource = cityWeatherRemoteDataSource
    }
    
    public func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherEntity, WeatherAppError>) -> Void) {
        cityWeatherRemoteDataSource.getCityWeather(by: woeid) { cityWeatherResultModel in
            switch cityWeatherResultModel {
            case .success(let cityWeatherModel):
                handler(.success(cityWeatherModel.dotCityWeatherModel()))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}

