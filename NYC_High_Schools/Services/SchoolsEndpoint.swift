//
//  SchoolsEndpoint.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/29/22.
//

import Foundation

enum SchoolsEndpoint: Endpoint {
    case getNearBySchools(zipCode: String)
    case getSchoolSATScores(dbn: String)
    
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
        case .getSchoolSATScores:
            return "/resource/f9bf-2cp4.json"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getSchoolSATScores(let dbn):
            return [URLQueryItem(name: "dbn", value: dbn)]
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .getNearBySchools, .getSchoolSATScores:
            return "GET"
        }
    }
}
