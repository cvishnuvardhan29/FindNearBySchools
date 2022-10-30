//
//  MockSchoolsService.swift
//  NYC_High_SchoolsTests
//
//  Created by Vishnu Chundi on 10/30/22.
//

@testable import NYC_High_Schools

class MockSchoolsService {
    typealias FetchSchoolResult = Result<[School], APIError>
    typealias FetchSATScoresResult = Result<[SchoolSATScoresDetails], APIError>
    
    func fetchSchools(with apiManager: APIManager, completion: @escaping (FetchSchoolResult) -> Void) {
        apiManager.request(endpoint: SchoolsEndpoint.getNearBySchools(zipCode: "10003")) { (result: FetchSchoolResult) in
            completion(result)
        }
    }
    
    func fetchSATScores(with apiManager: APIManager, for dbn: String, completion: @escaping (FetchSATScoresResult) -> Void) {
        apiManager.request(endpoint: SchoolsEndpoint.getSchoolSATScores(dbn: dbn)) { (result: FetchSATScoresResult) in
            completion(result)
        }
    }
}
