//
//  Navigation.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class AppCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var rootViewContoller: UIViewController {
        return navigationController
    }
    
    func start() {
        // Initialize ZipCode View Controller
        let zipCodeViewController = ZipCodeViewController.instantiate()
        
        // Push ZipCode View Controller Onto Navigaion Stack
        navigationController.pushViewController(zipCodeViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    func navigateToSchoolsViewController() {
        // Initialize Schools View Controller
        let schoolsViewController = SchoolsViewController.instantiate()
        
        // Configure View Model
        schoolsViewController.viewModel = SchoolsViewModel()
        
        // Push Schools View Controller Onto Navigaion Stack
        navigationController.pushViewController(schoolsViewController, animated: true)
    }
}
