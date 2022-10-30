//
//  SchoolSATScoresViewModelTests.swift
//  NYC_High_SchoolsTests
//
//  Created by Vishnu Chundi on 10/30/22.
//

import XCTest
@testable import NYC_High_Schools

final class SchoolSATScoresViewModelTests: XCTestCase {

    // MARK: - Properties
    var viewModel: SchoolSATScoresViewModel!
    var mockSchoolsService: MockSchoolsService!
    private let dbn = "29Q283"
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        viewModel = SchoolSATScoresViewModel(dbn: dbn)
        mockSchoolsService = MockSchoolsService()
    }

    override func tearDown()  {
        super.tearDown()
        viewModel = nil
        mockSchoolsService = nil
    }
    
    // MARK: - Tests
    
    func testAPIManagerNotNil() {
        XCTAssertNotNil(viewModel.apiManager)
    }
    
    func testFetchSATScoresNotNil() {
        // When
        let expectation = expectation(description: "Fetching School SAT Scores")
        mockSchoolsService.fetchSATScores(with: viewModel.apiManager, for: dbn) { result in
            switch result {
            case .success(let scores):
                self.viewModel.satScores = scores.first
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertNotNil(viewModel.satScores)
    }
    
    func testGetScoreDetails() {
        // When
        let expectation = expectation(description: "Fetching School SAT Scores")
        mockSchoolsService.fetchSATScores(with: viewModel.apiManager, for: dbn) { result in
            switch result {
            case .success(let scores):
                self.viewModel.satScores = scores.first
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertEqual(viewModel.getScoreDetails()?.dbn, viewModel.satScores?.dbn)
    }
    
    func testNoScoresErrorText() {
        XCTAssertEqual(viewModel.getNoScoresErrorText(), "No scores available! Please select different school")
    }

}
