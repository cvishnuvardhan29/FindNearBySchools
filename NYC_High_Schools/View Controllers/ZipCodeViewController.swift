//
//  ZipCodeViewController.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/28/22.
//

import UIKit

class ZipCodeViewController: MainViewController, Container {
          
    // MARK: - Outlet Properties
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    
    // MARK: - Container Properties
    
    typealias ViewModel = ZipCodeViewModel
    var viewModel: ZipCodeViewModel?
    
    // MARK: - Properties
    
    var didShowSchools: (() -> Void)?
    var isEnableFind: Bool = false {
        didSet {
            findButton.isEnabled = isEnableFind
        }
    }

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isEnableFind = false
    }
    
    // MARK: - Methods

    @IBAction func didTapOnFind(_ sender: UIButton) {
        didShowSchools?()
    }
}

// MARK: - UITextFieldDelegate Methods

extension ZipCodeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // Enabling the find button
        isEnableFind = updatedText.count == 5
        
        // make sure the result is not more than 5 characters
        return updatedText.count <= 5
    }
}
