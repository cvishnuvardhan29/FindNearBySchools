//
//  SchoolSATScoresViewModel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import Foundation

protocol SchoolSATScoresViewModelType {
    func fetchSATScores()
}

class SchoolSATScoresViewModel: SchoolSATScoresViewModelType {
    // MARK: - Properties
    
    var apiManager: APIManager
    var dbn: String
    var satScores: SchoolSATScoresDetails?
    
    // MARK: - Initializer Method
    
    init(apiManager: APIManager = APIManager(),
         dbn: String) {
        self.apiManager = apiManager
        self.dbn = dbn
    }
    
    // MARK: - Methods
    
    // Making an API call for School SAT Scores
    func fetchSATScores() {
        apiManager.request(endpoint: SchoolsEndpoint.getSchoolSATScores(dbn: dbn)) { (result: Result<[SchoolSATScoresDetails], APIError>) in
            switch result {
            case .success(let scoreDetails):
                self.satScores = scoreDetails.first
            case .failure(let error):
                print(error)
            }
        }
    }
}
