//
//  BaseViewModelProtocol.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation

protocol BaseViewModelProtocol{
    var delegate: BaseViewProtocol? { get set }
    func startPage() -> BaseViewProtocol
}
