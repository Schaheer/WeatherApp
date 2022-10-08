//
//  WeatherModel.swift
//  Weather App
//
//  Created by Schaheer Saleem on 08/10/2022.
//

import Foundation

struct WeatherModel : Codable {
    let queryCost : Int?
    let latitude : Double?
    let longitude : Double?
    let resolvedAddress : String?
    let address : String?
    let timezone : String?
    let tzoffset : Double?
    let description : String?
    let days : [Days]?
    let alerts : [String]?
    let stations : Stations?
    let currentConditions : CurrentConditions?

    enum CodingKeys: String, CodingKey {
        case queryCost = "queryCost"
        case latitude = "latitude"
        case longitude = "longitude"
        case resolvedAddress = "resolvedAddress"
        case address = "address"
        case timezone = "timezone"
        case tzoffset = "tzoffset"
        case description = "description"
        case days = "days"
        case alerts = "alerts"
        case stations = "stations"
        case currentConditions = "currentConditions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        queryCost = try values.decodeIfPresent(Int.self, forKey: .queryCost)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        resolvedAddress = try values.decodeIfPresent(String.self, forKey: .resolvedAddress)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        tzoffset = try values.decodeIfPresent(Double.self, forKey: .tzoffset)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        days = try values.decodeIfPresent([Days].self, forKey: .days)
        alerts = try values.decodeIfPresent([String].self, forKey: .alerts)
        stations = try values.decodeIfPresent(Stations.self, forKey: .stations)
        currentConditions = try values.decodeIfPresent(CurrentConditions.self, forKey: .currentConditions)
    }

}

struct Days : Codable {
    let datetime : String?
    let datetimeEpoch : Int?
    let tempmax : Double?
    let tempmin : Double?
    let temp : Double?
    let feelslikemax : Double?
    let feelslikemin : Double?
    let feelslike : Double?
    let dew : Double?
    let humidity : Double?
    let precip : Double?
    let precipprob : Double?
    let precipcover : Double?
    let snow : Double?
    let snowdepth : Double?
    let windgust : Double?
    let windspeed : Double?
    let winddir : Double?
    let pressure : Double?
    let cloudcover : Double?
    let visibility : Double?
    let solarradiation : Double?
    let uvindex : Double?
    let severerisk : Double?
    let sunrise : String?
    let sunriseEpoch : Int?
    let sunset : String?
    let sunsetEpoch : Int?
    let moonphase : Double?
    let conditions : String?
    let description : String?
    let icon : String?
    let stations : [String]?
    let source : String?
    let hours : [Hours]?

    enum CodingKeys: String, CodingKey {

        case datetime = "datetime"
        case datetimeEpoch = "datetimeEpoch"
        case tempmax = "tempmax"
        case tempmin = "tempmin"
        case temp = "temp"
        case feelslikemax = "feelslikemax"
        case feelslikemin = "feelslikemin"
        case feelslike = "feelslike"
        case dew = "dew"
        case humidity = "humidity"
        case precip = "precip"
        case precipprob = "precipprob"
        case precipcover = "precipcover"
        case snow = "snow"
        case snowdepth = "snowdepth"
        case windgust = "windgust"
        case windspeed = "windspeed"
        case winddir = "winddir"
        case pressure = "pressure"
        case cloudcover = "cloudcover"
        case visibility = "visibility"
        case solarradiation = "solarradiation"
        case uvindex = "uvindex"
        case severerisk = "severerisk"
        case sunrise = "sunrise"
        case sunriseEpoch = "sunriseEpoch"
        case sunset = "sunset"
        case sunsetEpoch = "sunsetEpoch"
        case moonphase = "moonphase"
        case conditions = "conditions"
        case description = "description"
        case icon = "icon"
        case stations = "stations"
        case source = "source"
        case hours = "hours"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
        datetimeEpoch = try values.decodeIfPresent(Int.self, forKey: .datetimeEpoch)
        tempmax = try values.decodeIfPresent(Double.self, forKey: .tempmax)
        tempmin = try values.decodeIfPresent(Double.self, forKey: .tempmin)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelslikemax = try values.decodeIfPresent(Double.self, forKey: .feelslikemax)
        feelslikemin = try values.decodeIfPresent(Double.self, forKey: .feelslikemin)
        feelslike = try values.decodeIfPresent(Double.self, forKey: .feelslike)
        dew = try values.decodeIfPresent(Double.self, forKey: .dew)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        precip = try values.decodeIfPresent(Double.self, forKey: .precip)
        precipprob = try values.decodeIfPresent(Double.self, forKey: .precipprob)
        precipcover = try values.decodeIfPresent(Double.self, forKey: .precipcover)
        snow = try values.decodeIfPresent(Double.self, forKey: .snow)
        snowdepth = try values.decodeIfPresent(Double.self, forKey: .snowdepth)
        windgust = try values.decodeIfPresent(Double.self, forKey: .windgust)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddir = try values.decodeIfPresent(Double.self, forKey: .winddir)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        cloudcover = try values.decodeIfPresent(Double.self, forKey: .cloudcover)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        solarradiation = try values.decodeIfPresent(Double.self, forKey: .solarradiation)
        uvindex = try values.decodeIfPresent(Double.self, forKey: .uvindex)
        severerisk = try values.decodeIfPresent(Double.self, forKey: .severerisk)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        sunriseEpoch = try values.decodeIfPresent(Int.self, forKey: .sunriseEpoch)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
        sunsetEpoch = try values.decodeIfPresent(Int.self, forKey: .sunsetEpoch)
        moonphase = try values.decodeIfPresent(Double.self, forKey: .moonphase)
        conditions = try values.decodeIfPresent(String.self, forKey: .conditions)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        stations = try values.decodeIfPresent([String].self, forKey: .stations)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        hours = try values.decodeIfPresent([Hours].self, forKey: .hours)
    }

}

struct CurrentConditions : Codable {
    let datetime : String?
    let datetimeEpoch : Int?
    let temp : Double?
    let feelslike : Double?
    let humidity : Double?
    let dew : Double?
    let precip : Double?
    let precipprob : String?
    let snow : Double?
    let snowdepth : Double?
    let windgust : String?
    let windspeed : Double?
    let winddir : Double?
    let pressure : Double?
    let visibility : Double?
    let cloudcover : Double?
    let solarradiation : Double?
    let uvindex : Double?
    let conditions : String?
    let icon : String?
    let stations : [String]?
    let sunrise : String?
    let sunriseEpoch : Int?
    let sunset : String?
    let sunsetEpoch : Int?
    let moonphase : Double?

    enum CodingKeys: String, CodingKey {

        case datetime = "datetime"
        case datetimeEpoch = "datetimeEpoch"
        case temp = "temp"
        case feelslike = "feelslike"
        case humidity = "humidity"
        case dew = "dew"
        case precip = "precip"
        case precipprob = "precipprob"
        case snow = "snow"
        case snowdepth = "snowdepth"
        case windgust = "windgust"
        case windspeed = "windspeed"
        case winddir = "winddir"
        case pressure = "pressure"
        case visibility = "visibility"
        case cloudcover = "cloudcover"
        case solarradiation = "solarradiation"
        case uvindex = "uvindex"
        case conditions = "conditions"
        case icon = "icon"
        case stations = "stations"
        case sunrise = "sunrise"
        case sunriseEpoch = "sunriseEpoch"
        case sunset = "sunset"
        case sunsetEpoch = "sunsetEpoch"
        case moonphase = "moonphase"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
        datetimeEpoch = try values.decodeIfPresent(Int.self, forKey: .datetimeEpoch)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelslike = try values.decodeIfPresent(Double.self, forKey: .feelslike)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        dew = try values.decodeIfPresent(Double.self, forKey: .dew)
        precip = try values.decodeIfPresent(Double.self, forKey: .precip)
        precipprob = try values.decodeIfPresent(String.self, forKey: .precipprob)
        snow = try values.decodeIfPresent(Double.self, forKey: .snow)
        snowdepth = try values.decodeIfPresent(Double.self, forKey: .snowdepth)
        windgust = try values.decodeIfPresent(String.self, forKey: .windgust)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddir = try values.decodeIfPresent(Double.self, forKey: .winddir)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        cloudcover = try values.decodeIfPresent(Double.self, forKey: .cloudcover)
        solarradiation = try values.decodeIfPresent(Double.self, forKey: .solarradiation)
        uvindex = try values.decodeIfPresent(Double.self, forKey: .uvindex)
        conditions = try values.decodeIfPresent(String.self, forKey: .conditions)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        stations = try values.decodeIfPresent([String].self, forKey: .stations)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        sunriseEpoch = try values.decodeIfPresent(Int.self, forKey: .sunriseEpoch)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
        sunsetEpoch = try values.decodeIfPresent(Int.self, forKey: .sunsetEpoch)
        moonphase = try values.decodeIfPresent(Double.self, forKey: .moonphase)
    }

}

struct Hours : Codable {
    let datetime : String?
    let datetimeEpoch : Int?
    let temp : Double?
    let feelslike : Double?
    let humidity : Double?
    let dew : Double?
    let precip : Double?
    let precipprob : Double?
    let snow : Double?
    let snowdepth : Double?
    let windgust : Double?
    let windspeed : Double?
    let winddir : Double?
    let pressure : Double?
    let visibility : Double?
    let cloudcover : Double?
    let solarradiation : Double?
    let uvindex : Double?
    let severerisk : Double?
    let conditions : String?
    let icon : String?
    let stations : [String]?
    let source : String?

    enum CodingKeys: String, CodingKey {

        case datetime = "datetime"
        case datetimeEpoch = "datetimeEpoch"
        case temp = "temp"
        case feelslike = "feelslike"
        case humidity = "humidity"
        case dew = "dew"
        case precip = "precip"
        case precipprob = "precipprob"
        case snow = "snow"
        case snowdepth = "snowdepth"
        case windgust = "windgust"
        case windspeed = "windspeed"
        case winddir = "winddir"
        case pressure = "pressure"
        case visibility = "visibility"
        case cloudcover = "cloudcover"
        case solarradiation = "solarradiation"
        case uvindex = "uvindex"
        case severerisk = "severerisk"
        case conditions = "conditions"
        case icon = "icon"
        case stations = "stations"
        case source = "source"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
        datetimeEpoch = try values.decodeIfPresent(Int.self, forKey: .datetimeEpoch)
        temp = try values.decodeIfPresent(Double.self, forKey: .temp)
        feelslike = try values.decodeIfPresent(Double.self, forKey: .feelslike)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        dew = try values.decodeIfPresent(Double.self, forKey: .dew)
        precip = try values.decodeIfPresent(Double.self, forKey: .precip)
        precipprob = try values.decodeIfPresent(Double.self, forKey: .precipprob)
        snow = try values.decodeIfPresent(Double.self, forKey: .snow)
        snowdepth = try values.decodeIfPresent(Double.self, forKey: .snowdepth)
        windgust = try values.decodeIfPresent(Double.self, forKey: .windgust)
        windspeed = try values.decodeIfPresent(Double.self, forKey: .windspeed)
        winddir = try values.decodeIfPresent(Double.self, forKey: .winddir)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        cloudcover = try values.decodeIfPresent(Double.self, forKey: .cloudcover)
        solarradiation = try values.decodeIfPresent(Double.self, forKey: .solarradiation)
        uvindex = try values.decodeIfPresent(Double.self, forKey: .uvindex)
        severerisk = try values.decodeIfPresent(Double.self, forKey: .severerisk)
        conditions = try values.decodeIfPresent(String.self, forKey: .conditions)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        stations = try values.decodeIfPresent([String].self, forKey: .stations)
        source = try values.decodeIfPresent(String.self, forKey: .source)
    }

}

struct Stations : Codable {
    

}
