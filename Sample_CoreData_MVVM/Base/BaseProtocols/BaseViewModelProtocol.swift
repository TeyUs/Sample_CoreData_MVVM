//
//  BaseViewModelProtocol.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UIViewController

protocol BaseViewModelProtocol{
    associatedtype ViewType: BaseViewControllerProtocol
    associatedtype ModelType: BaseModelProtocol
    var delegate: ViewType? { get set }
    var model: ModelType { get set }
//    mutating func startPage() -> ViewType
}

extension BaseViewModelProtocol{
    mutating func startPage() -> ViewType {
        let viewController = ViewType.instantiate()
        self.delegate = viewController
        guard let self = self as? Self.ViewType.ViewModelType else {
            fatalError("\(ViewType.className) instantiate")
        }
        viewController.viewModel = self
        return viewController
    }
}
