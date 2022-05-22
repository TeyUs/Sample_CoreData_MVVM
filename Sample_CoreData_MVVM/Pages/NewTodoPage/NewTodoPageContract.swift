//
//  NewTodoPageContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import Foundation


protocol NewTodoPageViewModelProtocol: BaseViewModelProtocol where ViewType: NewTodoPageViewControllerProtocol, ModelType: NewTodoPageModelProtocol{

}

protocol NewTodoPageViewControllerProtocol: BaseViewProtocol where ViewModelType :NewTodoPageViewModelProtocol{

}

protocol NewTodoPageModelProtocol: BaseModelProtocol{

}
