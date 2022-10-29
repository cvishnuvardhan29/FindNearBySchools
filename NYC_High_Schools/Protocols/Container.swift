//
//  Container.swift
//  NYC_High_Schools
//
//  Created by Vishnu Chundi on 10/29/22.
//

import Foundation

protocol Container {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
}
