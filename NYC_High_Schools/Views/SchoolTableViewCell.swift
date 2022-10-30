//
//  SchoolTableViewCell.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class SchoolTableViewCell: UITableViewCell, CellIdentifiable {
    static var identifier: String = "SchoolTableViewCell"
    
    // MARK: - Outlet Properties
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Predefined Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Helper Methods
    
    func configureData(for school: SchoolDetails) {
        // Setting School Name
        nameLabel.text = school.schoolName
        
        // Truncating the coordinates and updating the school address
        let address = school.location?.split(separator: "(")[0]
        overviewLabel.text = "Address: \(address ?? "")"
        
        // Updating the School Phone Number
        phoneNumberLabel.text = "Phone: \(school.phoneNumber ?? "")"
        
        // Updating the School Email
        emailLabel.text = "Email: \(school.email ?? "")"
    }

}
