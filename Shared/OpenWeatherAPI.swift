//
//  OpenWeatherAPI.swift
//  WeatherApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2021/10/05.
//

import Foundation

enum ApiError: Error {
    case couldNotParseResponse
    case swiftError(Error)
}

//protocol OpenWeatherAPIProtocol {
//    //: OpenWeatherAPIProtocol
//    func getCurrentWeather(forCityName cityName: String, completion: @escaping ((Result<(String, String), ApiError>) -> Void))
//}

class OpenWeatherAPI {

    static var shared = OpenWeatherAPI()

    //static var appId = "appId here"

    func getCurrentWeather(forCityName cityName: String, completion: @escaping ((Result<(String, String), ApiError>) -> Void)) {
        // URL: https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
        var comps = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        comps.queryItems = [URLQueryItem(name: "q", value: cityName),
                            URLQueryItem(name: "units", value: "metric"),
                            URLQueryItem(name: "appid", value: OpenWeatherAPI.appId)]
        let request = URLRequest(url: comps.url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { maybeData, maybeUrlResponse, maybeError in
            if let error = maybeError {
                return completion(.failure(.swiftError(error)))
            }
            let data = maybeData ?? Data()
            guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) else {
                return completion(.failure(.couldNotParseResponse))
            }
            print("dictionary: \(dictionary)")

            //dictionary["main"]["temp"]


        }

    }
}
