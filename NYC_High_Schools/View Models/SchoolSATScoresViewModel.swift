//
//  SchoolSATScoresViewModel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import Foundation

protocol SchoolSATScoresViewModelType {
    var delegate: SchoolSATScoresViewModelDelegate? { get set }
    
    func fetchSATScores()
    func getScoreDetails() -> SchoolSATScoresDetails?
    func getNoScoresErrorText() -> String
}

protocol SchoolSATScoresViewModelDelegate: AnyObject {
    func reloadView()
    func showFailureError(with error: Error)
}

class SchoolSATScoresViewModel: SchoolSATScoresViewModelType {
    // MARK: - Properties
    
    private var apiManager: APIManager
    private var satScores: SchoolSATScoresDetails?
    var dbn: String

    weak var delegate: SchoolSATScoresViewModelDelegate?
    
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
                self.delegate?.reloadView()
            case .failure(let error):
                self.delegate?.showFailureError(with: error)
            }
        }
    }
    
    func getScoreDetails() -> SchoolSATScoresDetails? {
        satScores
    }
    
    func getNoScoresErrorText() -> String {
        "No scores available! Please select different school"
    }
}
