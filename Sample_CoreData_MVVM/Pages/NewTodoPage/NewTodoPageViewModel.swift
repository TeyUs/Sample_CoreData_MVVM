//
//  NewTodoPageViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import Foundation
import UIKit.UIColor

final class NewTodoPageViewModel: NewTodoPageViewModelProtocol {
    typealias ViewType = NewTodoPageViewController
    typealias ModelType = NewTodoPageModel

    weak var delegate: NewTodoPageViewController?
    var model: NewTodoPageModel

    var refreshCell: (_ change: ChangeInCell) -> ()

    internal init(refreshCell: @escaping (ChangeInCell) -> ()) {
        self.refreshCell = refreshCell
        self.model = NewTodoPageModel(title: "", detail: "", color: .white, withCoreData: false)
    }

    func saveData(title: String?, detail: String?, color: UIColor, completion: @escaping () -> Void){
        guard let title = title,
              title != "",
              let detail = detail else { return }
        model = ModelType(title: title, detail: detail, color: color)
        refreshCell(.created(listPageModel: ListPageModel(newTodoPageModel: model)))
        completion()
    }
}
