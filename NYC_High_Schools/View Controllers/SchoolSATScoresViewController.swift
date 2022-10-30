//
//  SchoolSATScoresViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import UIKit

class SchoolSATScoresViewController: UIViewController, Container, Storyboardable {
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    // MARK: - Container Properties
    
    typealias ViewModel = SchoolSATScoresViewModelType
    var viewModel: SchoolSATScoresViewModelType? {
        didSet {
            viewModel?.delegate = self
        }
    }

    // MARK: - View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SAT Score"
        
        // Fetching the SAT Scores
        viewModel?.fetchSATScores()
    }
    
    // MARK: - Helper Methods
    private func configureData() {
        guard let scores = viewModel?.getScoreDetails() else { return }
        schoolNameLabel.text = scores.schoolName
        mathScoreLabel.text = scores.mathAverageScore
        readingScoreLabel.text = scores.readingAverageScore
        writingScoreLabel.text = scores.writingAverageScore
    }
}

extension SchoolSATScoresViewController: SchoolSATScoresViewModelDelegate {
    func reloadView() {
        DispatchQueue.main.async {
            self.configureData()
        }
    }
    
    func showFailureError(with error: Error) {
        // TODO: Handle Error Scenario
    }
}
