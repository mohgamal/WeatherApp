//
//  CityWeatherEntity.swift
//  WeatherAppDomain
//
//  Created by Mohammed Abd El-Aty on 20/06/2021.
//

import Foundation

public struct CityWeatherEntity: Codable {
    public let consolidated_weather : [ConsolidatedWeatherEntity]?
    public let time : String?
    public let sun_rise : String?
    public let sun_set : String?
    public let timezone_name : String?
    public let parent : ParentEntity?
    public let sources : [SourcesEntity]?
    public let title : String?
    public let location_type : String?
    public let woeid : Int?
    public let latt_long : String?
    public let timezone : String?
    
    public init (consolidated_weather : [ConsolidatedWeatherEntity]?, time : String?, sun_rise : String?, sun_set : String?, timezone_name : String?,
                 parent : ParentEntity?, sources : [SourcesEntity]?, title : String?, location_type : String?, woeid : Int?, latt_long : String?, timezone : String?) {
        self.consolidated_weather = consolidated_weather
        self.time = time
        self.sun_rise = sun_rise
        self.sun_set = sun_set
        self.timezone_name = timezone_name
        self.parent = parent
        self.sources = sources
        self.title = title
        self.location_type = location_type
        self.woeid = woeid
        self.latt_long = latt_long
        self.timezone = timezone
    }
    
    public struct ParentEntity : Codable {
        public let title : String?
        public let location_type : String?
        public let woeid : Int?
        public let latt_long : String?
        
        public init (title: String?, location_type: String?, woeid: Int?, latt_long: String?) {
            self.title = title
            self.location_type = location_type
            self.woeid = woeid
            self.latt_long = latt_long
        }
    }
    
    public struct SourcesEntity : Codable {
        public let title : String?
        public let slug : String?
        public let url : String?
        public let crawl_rate : Int?
        
        public init (title : String?, slug : String?, url : String?, crawl_rate : Int?) {
            self.title = title
            self.slug = slug
            self.url = url
            self.crawl_rate = crawl_rate
        }
    }
    
    public struct ConsolidatedWeatherEntity: Codable {
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
        
        public init (id : Int?, weather_state_name : String?, weather_state_abbr : String?, wind_direction_compass : String?, created : String?,
                     applicable_date : String?, min_temp : Double?, max_temp : Double?, the_temp : Double?, wind_speed : Double?, wind_direction : Double?,
                     air_pressure : Double?, humidity : Int?, visibility : Double?, predictability : Int?) {
            self.id = id
            self.weather_state_name = weather_state_name
            self.weather_state_abbr = weather_state_abbr
            self.wind_direction_compass = wind_direction_compass
            self.created = created
            self.applicable_date = applicable_date
            self.min_temp = min_temp
            self.max_temp = max_temp
            self.the_temp = the_temp
            self.wind_speed = wind_speed
            self.wind_direction = wind_direction
            self.air_pressure = air_pressure
            self.humidity = humidity
            self.visibility = visibility
            self.predictability = predictability
        }
    }
}
