//
//  ViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

protocol Container {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
}

class SchoolsViewController: UITableViewController, Container, Storyboardable {
    
    typealias ViewModel = SchoolsViewModel
    
    var viewModel: SchoolsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func registerTableViewCells() {
        self.tableView.register(SchoolTableViewCell.self, forCellReuseIdentifier: SchoolTableViewCell.identifier)
    }

}

// MARK: TableView DataSource
extension SchoolsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfSchools() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.identifier, for: indexPath) as? SchoolTableViewCell else { return UITableViewCell() }
        if let school = viewModel?.getSchool(at: indexPath.row) {
            cell.configureData(for: school, at: indexPath.row)
        }
        return cell
    }
}
