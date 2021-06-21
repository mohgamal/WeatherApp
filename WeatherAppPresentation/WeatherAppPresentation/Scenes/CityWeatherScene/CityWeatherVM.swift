//
//  CityWeatherVM.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import WeatherAppDomain
import Combine

public class CityWeatherVM: ObservableObject {
    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    var error: Error?
    
    var cityWeatherResultEntity: CityWeatherEntity?
    
    private var cityWeatherInteractor: CityWeatherInteractor
    
    public init (cityWeatherInteractor: CityWeatherInteractor) {
        self.cityWeatherInteractor = cityWeatherInteractor
    }
    
    func getCityWeatherData(by woeid: Int) {
        self.cityWeatherInteractor.getCityWeather(by: woeid) { [weak self] cityWeatherResultModel in
            DispatchQueue.main.async {
                switch cityWeatherResultModel {
                case .success(let cityWeatherEntity):
                    self?.error = nil
                    self?.cityWeatherResultEntity = cityWeatherEntity
                    self?.objectWillChange.send()
                case .failure(let error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
