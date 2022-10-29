//
//  SchoolTableViewCell.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

protocol CellIdentifiable {
    static var identifier: String { get }
}

class SchoolTableViewCell: UITableViewCell, CellIdentifiable {
    static var identifier: String = "SchoolTableViewCell"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(for school: SchoolDetails,
                       at schoolNumber: Int) {
        numberLabel.text = "\(schoolNumber)"
        nameLabel.text = school.schoolName
        overviewLabel.text = school.overviewParagraph
    }

}
