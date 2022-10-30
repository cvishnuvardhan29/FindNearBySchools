//
//  SchoolsViewModel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import Foundation

protocol SchoolViewModelType {
    var delegate: SchoolsViewModelDelegate? { get set }
    
    func fetchSchools()
    func getSchool(at index: Int) -> School
    func getNumberOfSchools() -> Int
}

protocol SchoolsViewModelDelegate: AnyObject {
    func reloadSchools()
    func showFailureError(with error: Error)
}

class SchoolsViewModel: SchoolViewModelType {
    // MARK: - Properties
    var apiManager: APIManager
    var schools: [School] = []
    weak var delegate: SchoolsViewModelDelegate?
    
    // MARK: - Initializer Method
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    // MARK: - Methods
    
    // Making get near by schools API with dummy Zip Code
    func fetchSchools() {
        apiManager.request(endpoint: SchoolsEndpoint.getNearBySchools(zipCode: "10003")) { (result: Result<[School], APIError>) in
            switch result {
            case .success(let schools):
                self.schools = schools
                self.delegate?.reloadSchools()
            case .failure(let error):
                self.delegate?.showFailureError(with: error)
            }
        }
    }
    
    // Get School Details for Particular Index
    func getSchool(at index: Int) -> School {
        schools[index]
    }
    
    // Get Number of Schools
    func getNumberOfSchools() -> Int {
        schools.count
    }
}
