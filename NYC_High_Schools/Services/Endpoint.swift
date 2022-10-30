//
//  Endpoint.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/29/22.
//

import Foundation

protocol Endpoint {
    
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
}
