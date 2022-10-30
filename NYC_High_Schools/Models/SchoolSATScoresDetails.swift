//
//  SchoolSATScoresDetails.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import Foundation

struct SchoolSATScoresDetails: Codable {
    var dbn: String?
    var schoolName: String?
    var numberOfTestTakers: String?
    var readingAverageScore: String?
    var mathAverageScore: String?
    var writingAverageScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case numberOfTestTakers = "num_of_sat_test_takers"
        case readingAverageScore = "sat_critical_reading_avg_score"
        case mathAverageScore = "sat_math_avg_score"
        case writingAverageScore = "sat_writing_avg_score"
    }
}
