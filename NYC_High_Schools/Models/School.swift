//
//  School.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import Foundation

struct School: Codable {
    var dbn: String?
    var schoolName: String?
    var location: String?
    var phoneNumber: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case location = "location"
        case phoneNumber = "phone_number"
        case email = "school_email"
    }
}
