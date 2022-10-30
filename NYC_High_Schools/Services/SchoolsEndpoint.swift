//
//  SchoolsEndpoint.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/29/22.
//

import Foundation

enum SchoolsEndpoint: Endpoint {
    case getNearBySchools(zipCode: String)
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    var baseURL: String {
        switch self {
        default:
            return "data.cityofnewyork.us"
        }
    }
    
    var path: String {
        switch self {
        case .getNearBySchools:
            return "/resource/s3k6-pzi2.json"
        }
    }
    
    var method: String {
        switch self {
        case .getNearBySchools:
            return "GET"
        }
    }
}
