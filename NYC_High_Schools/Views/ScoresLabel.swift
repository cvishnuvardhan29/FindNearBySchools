//
//  ScoresLabel.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/30/22.
//

import UIKit

class ScoresLabel: UILabel {
    
    // MARK: - Initialzer Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.applyCornerRadius()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.applyCornerRadius()
    }
    
    // MARK: - Appearance Modifier Method
    
    func applyCornerRadius() {
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
