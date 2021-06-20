//
//  CityWeatherRemoteDataSource.swift
//  WeatherAppData
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation
import WeatherAppDomain

public protocol CityWeatherRemoteDataSourceInterface {
    init (urlString: String)
    
    func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherModel, WeatherAppError>) -> Void)
}

public class CityWeatherRemoteDataSource: CityWeatherRemoteDataSourceInterface {
    let urlString: String
    
    required public init(urlString: String ) {
        self.urlString = urlString
    }
    
    public func getCityWeather(by woeid: Int, handler: @escaping (Result<CityWeatherModel, WeatherAppError>) -> Void) {
        guard let url = URL(string: "\(urlString)/\(woeid)") else {
            handler(.failure(WeatherAppError.NotFound))
            return
        }
        
        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(WeatherAppError.BadRequest))
                case 404:
                    handler(.failure(WeatherAppError.NotFound))
                case 500:
                    handler(.failure(WeatherAppError.InternalServerError))
                default:
                    handler(.failure(WeatherAppError.InternalServerError))
                }
             }
            
            guard let data = data else {
              if let error = error {
                handler(.failure(WeatherAppError.UnknownError(message: error.localizedDescription)))
              }
              return
            }

            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(CityWeatherModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(WeatherAppError.WrongData))
            }
        }
        task.resume()
    }
    
}
