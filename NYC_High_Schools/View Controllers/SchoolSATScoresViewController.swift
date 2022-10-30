//
//  SchoolSATScoresViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import UIKit

class SchoolSATScoresViewController: UIViewController, Container, Storyboardable {
    
    // MARK: - Container Properties
    
    typealias ViewModel = SchoolSATScoresViewModel
    var viewModel: SchoolSATScoresViewModel?

    // MARK: - View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetching the SAT Scores
        viewModel?.fetchSATScores()
    }
}
