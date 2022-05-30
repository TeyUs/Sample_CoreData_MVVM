//
//  NewTodoPageContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import Foundation
import UIKit.UIColor
import MVVMBaseProtocols


protocol NewTodoPageViewModelProtocol: BaseViewModelProtocol where ViewType: NewTodoPageViewControllerProtocol, ModelType: NewTodoPageModelProtocol{
    var refreshCell: (_ change: ChangeInCell) -> () { get }
    func saveData(title: String?, detail: String?, color: UIColor, completion: @escaping () -> Void)
}

protocol NewTodoPageViewControllerProtocol: BaseViewProtocol where ViewModelType :NewTodoPageViewModelProtocol{

}

protocol NewTodoPageModelProtocol: BaseModelProtocol{

}
