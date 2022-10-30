//
//  SchoolDetailsModel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import Foundation

struct SchoolsResponse: Codable {
    var schools: [SchoolDetails]
}

struct SchoolDetails: Codable {
    var dbn: String?
    var schoolName: String?
    var overviewParagraph: String?
    var totalStudents: Int?
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
    }
}
