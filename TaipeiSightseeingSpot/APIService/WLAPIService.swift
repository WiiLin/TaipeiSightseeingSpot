//
//  WLAPIService.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit


class WLAPIService: NSObject {
    static let shared : WLAPIService = WLAPIService()
    
    
    func getSightseeingSpotList(limit : Int = Int(WLSightseeingSpotParameterKeys.limit.defaultValue)!,
                                offset : Int,
                                success : @escaping (([WLSightseeingSpot]) ->()),
                                failure : @escaping ((NSError) ->())){
        
        var urlComponents = URLComponents()
        urlComponents.scheme    = WLSightseeingSpotURLComponents.scheme.rawValue
        urlComponents.host      = WLSightseeingSpotURLComponents.host.rawValue
        urlComponents.path      = WLSightseeingSpotURLComponents.path.rawValue
        let scopeItem = URLQueryItem(name: WLSightseeingSpotParameterKeys.scope.rawValue, value: WLSightseeingSpotParameterKeys.scope.defaultValue)
        let ridItem = URLQueryItem(name: WLSightseeingSpotParameterKeys.rid.rawValue, value: WLSightseeingSpotParameterKeys.rid.defaultValue)
        let limitItem = URLQueryItem(name: WLSightseeingSpotParameterKeys.limit.rawValue, value: String(limit))
        let offsetItem = URLQueryItem(name: WLSightseeingSpotParameterKeys.offset.rawValue, value: String(offset))
        urlComponents.queryItems = [scopeItem,ridItem,limitItem,offsetItem]
        guard let url = urlComponents.url else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Could not create URL from components"])
            failure(error)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    failure(error as NSError)
                } else if let jsonData = responseData {
                    do {
                        let jsonData = try JSONDecoder().decode(SightseeingSpotResult.self, from: jsonData)
                        
                        success(jsonData.result.results)
                    } catch {
                        failure(error as NSError)
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    failure(error)
                }
            }
        }
        
        task.resume()
        
        
    }
}
