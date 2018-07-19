//
//  WLSightseeingSpot.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//
enum WLSightseeingSpotURLComponents : String {
    case scheme    = "http"
    case host      = "data.taipei"
    case path      = "/opendata/datalist/apiAccess"
}

enum WLSightseeingSpotParameterKeys : String {
    case scope      = "scope"
    case rid        = "rid"
    case limit      = "limit"
    case offset     = "offset"
    
    var defaultValue : String{
        switch self {
        case .scope:    return "resourceAquire"
        case .rid:      return "36847f3f-deff-4183-a5bb-800737591de5"
        case .limit:    return "10"
        case .offset:   return "0"
        }
    }
}

struct SightseeingSpotResult: Decodable {
    let result: SightseeingSpotResults
}

struct SightseeingSpotResults: Decodable {
    let limit: Int
    let offset: Int
    let results: [WLSightseeingSpot]
}


struct WLSightseeingSpot: Decodable {
    let stitle  : String
    let xbody   : String
    let file    : String
    private var _files : [String]?
    
    mutating func files() -> [String]{
        if let _files = self._files{
            return _files
        }
        else{
            //mp3都不能播，所幸拔掉
            let files = file.components(separatedBy: "http://").filter({ $0 != "" && false == $0.contains("mp3")})
            self._files = files.map({"http://" + $0})
            return files
        }
    }
}

