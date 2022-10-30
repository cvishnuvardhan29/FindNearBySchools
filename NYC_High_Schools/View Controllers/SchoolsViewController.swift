//
//  SchoolsViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class SchoolsViewController: MainViewController, Container {
        
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Container Properties

    typealias ViewModel = SchoolViewModelType
    var viewModel: SchoolViewModelType? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: - Properties
    
    var didShowSATScores: ((String) -> Void)?

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isAnimating = true
        // Fetching the schools
        viewModel?.fetchSchools()
    }

    // MARK: - Helper Methods
    
    private func registerTableViewCells() {
        self.tableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: SchoolTableViewCell.identifier)
    }
}

// MARK: - TableView DataSource

extension SchoolsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfSchools() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier, for: indexPath) as? SchoolTableViewCell else { return UITableViewCell() }
        if let school = viewModel?.getSchool(at: indexPath.row) {
            cell.configureData(for: school)
        }
        return cell
    }
}

// MARK: - TableView Delegate

extension SchoolsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dbn = viewModel?.getSchool(at: indexPath.row).dbn {
            self.didShowSATScores?(dbn)
        }
    }
}

// MARK: - SchoolsViewModel Delegate

extension SchoolsViewController: SchoolsViewModelDelegate {
    func reloadSchools() {
        DispatchQueue.main.async {
            self.isAnimating = false
            self.tableView.reloadData()
        }
    }
    
    func showFailureError(with error: Error) {
        // TODO: Handle API Error Scenario
    }
}
