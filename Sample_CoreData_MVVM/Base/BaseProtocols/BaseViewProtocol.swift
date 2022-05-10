//
//  BaseViewProtocol.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UIViewController

protocol BaseViewControllerProtocol{
    static var storyboardName: String {get}
    var viewModel: BaseViewModelProtocol? { get set }
}

typealias BaseViewProtocol = UIViewController & BaseViewControllerProtocol
