//
//  SchoolsViewModelTests.swift
//  NYC_High_SchoolsTests
//
//  Created by Vishnu Chundi on 10/30/22.
//

import XCTest
@testable import NYC_High_Schools

final class SchoolsViewModelTests: XCTestCase {

    // MARK: - Properties
    
    var viewModel: SchoolsViewModel!
    var mockSchoolsService: MockSchoolsService!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        viewModel = SchoolsViewModel()
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
    
    func testFetchSchoolsNotEmpty() {
        // When
        let expectation = expectation(description: "Fetching schools")
        mockSchoolsService.fetchSchools(with: viewModel.apiManager) { result in
            switch result {
            case .success(let schools):
                self.viewModel.schools = schools
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertTrue(!viewModel.schools.isEmpty)
    }
    
    func testNumberOfSchools() {
        // When
        let expectation = expectation(description: "Fetching schools")
        mockSchoolsService.fetchSchools(with: viewModel.apiManager) { result in
            switch result {
            case .success(let schools):
                self.viewModel.schools = schools
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertEqual(viewModel.getNumberOfSchools(), viewModel.schools.count)
    }
    
    func testGetSchool() {
        // When
        let expectation = expectation(description: "Fetching schools")
        mockSchoolsService.fetchSchools(with: viewModel.apiManager) { result in
            switch result {
            case .success(let schools):
                self.viewModel.schools = schools
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        let index = 0
        
        // Then
        XCTAssertEqual(viewModel.getSchool(at: index).dbn, viewModel.schools[index].dbn)
    }

}
