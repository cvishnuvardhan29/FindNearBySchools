//
//  Navigation.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewContoller: UIViewController {
        return navigationController
    }
    
    func start() {
        // Initialize ZipCode View Controller
        let zipCodeViewController = ZipCodeViewController.instantiate()
        
        zipCodeViewController.didShowSchools = { [weak self] in
            self?.showSchools()
        }
        
        // Push ZipCode View Controller Onto Navigaion Stack
        navigationController.pushViewController(zipCodeViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func showSchools() {
        // Initialize Schools View Controller
        let schoolsViewController = SchoolsViewController.instantiate()
        
        schoolsViewController.didShowSATScores = { [weak self] dbn in
            self?.showSchoolSATScores(dbn: dbn)
        }
        
        // Configure View Model
        schoolsViewController.viewModel = SchoolsViewModel()
        
        // Push Schools View Controller Onto Navigaion Stack
        navigationController.pushViewController(schoolsViewController, animated: true)
    }
    
    private func showSchoolSATScores(dbn: String) {
        // Initialize School SAT Scores View Controller
        let satScoresViewController = SchoolSATScoresViewController.instantiate()
        
        // Configure View Model
        satScoresViewController.viewModel = SchoolSATScoresViewModel(dbn: dbn)
        
        // Push School SAT Scores View Controller Onto Navigaion Stack
        navigationController.pushViewController(satScoresViewController, animated: true)
    }
}
