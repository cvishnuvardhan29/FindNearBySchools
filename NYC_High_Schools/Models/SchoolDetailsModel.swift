//
//  SchoolDetailsModel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import Foundation

struct SchoolDetails: Codable {
    var dbn: String?
    var schoolName: String?
    var overviewParagraph: String?
    var totalStudents: Int?
}
