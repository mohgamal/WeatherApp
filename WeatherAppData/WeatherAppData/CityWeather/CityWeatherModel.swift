//
//  CityWeatherModel.swift
//  WeatherAppData
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation
import WeatherAppDomain

public struct CityWeatherModel: Codable {
    public let consolidated_weather : [ConsolidatedWeatherModel]?
    public let time : String?
    public let sun_rise : String?
    public let sun_set : String?
    public let timezone_name : String?
    public let parent : ParentModel?
    public let sources : [SourcesModel]?
    public let title : String?
    public let location_type : String?
    public let woeid : Int?
    public let latt_long : String?
    public let timezone : String?
    
    func dotCityWeatherModel() -> CityWeatherEntity {
        var consolidatedWeatherList: [CityWeatherEntity.ConsolidatedWeatherEntity] = []
        
        for weather in self.consolidated_weather ?? [] {
            consolidatedWeatherList.append(weather.dotConsolidatedWeather())
        }
        
        var sourcesList: [CityWeatherEntity.SourcesEntity] = []
        
        for source in self.sources ?? [] {
            sourcesList.append(source.dotSources())
        }
        
        return CityWeatherEntity(consolidated_weather: consolidatedWeatherList, time: self.time, sun_rise: self.sun_rise, sun_set: self.sun_set, timezone_name: self.timezone_name, parent: self.parent?.dotParent(), sources: sourcesList, title: self.title, location_type: self.location_type, woeid: self.woeid, latt_long: self.latt_long, timezone: self.timezone)
    }
}


public struct ParentModel : Codable {
    public let title : String?
    public let location_type : String?
    public let woeid : Int?
    public let latt_long : String?
    
    func dotParent() -> CityWeatherEntity.ParentEntity {
        return CityWeatherEntity.ParentEntity(title: self.title, location_type: self.location_type, woeid: self.woeid, latt_long: self.latt_long)
    }
}

public struct SourcesModel : Codable {
    public let title : String?
    public let slug : String?
    public let url : String?
    public let crawl_rate : Int?
    
    func dotSources() -> CityWeatherEntity.SourcesEntity {
        return CityWeatherEntity.SourcesEntity(title: self.title, slug: self.slug, url: self.url, crawl_rate: self.crawl_rate)
    }
}

public struct ConsolidatedWeatherModel: Codable {
    public let id : Int?
    public let weather_state_name : String?
    public let weather_state_abbr : String?
    public let wind_direction_compass : String?
    public let created : String?
    public let applicable_date : String?
    public let min_temp : Double?
    public let max_temp : Double?
    public let the_temp : Double?
    public let wind_speed : Double?
    public let wind_direction : Double?
    public let air_pressure : Double?
    public let humidity : Int?
    public let visibility : Double?
    public let predictability : Int?
    
    func dotConsolidatedWeather() -> CityWeatherEntity.ConsolidatedWeatherEntity {
        return CityWeatherEntity.ConsolidatedWeatherEntity(id: self.id, weather_state_name: self.weather_state_name, weather_state_abbr: self.weather_state_abbr, wind_direction_compass: self.wind_direction_compass, created: self.created, applicable_date: self.applicable_date, min_temp: self.min_temp, max_temp: self.max_temp, the_temp: self.the_temp, wind_speed: self.wind_speed, wind_direction: self.wind_direction, air_pressure: self.air_pressure, humidity: self.humidity, visibility: self.visibility, predictability: self.predictability)
    }
}
