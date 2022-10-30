//
//  ViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class SchoolsViewController: UITableViewController, Container, Storyboardable {
    
    // MARK: - Container Properties
    
    typealias ViewModel = SchoolViewModelType
    var viewModel: SchoolViewModelType? {
        didSet {
            viewModel?.delegate = self
        }
    }

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetching the schools
        viewModel?.fetchSchools()
    }

    // MARK: - Helper Methods
    
    private func registerTableViewCells() {
        self.tableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: SchoolTableViewCell.identifier)
    }
    
    // MARK: - TableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfSchools() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier, for: indexPath) as? SchoolTableViewCell else { return UITableViewCell() }
        if let school = viewModel?.getSchool(at: indexPath.row) {
            cell.configureData(for: school)
        }
        return cell
    }
}

extension SchoolsViewController: SchoolsViewModelDelegate {
    func reloadSchools() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showFailureError(with error: Error) {
        // TODO: Handle Error Scenario
    }
}
