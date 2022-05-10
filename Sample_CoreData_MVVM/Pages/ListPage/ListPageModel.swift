//
//  ListPageModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UIColor

struct ListPageModel: BaseModelProtocol {
    var title: String
    var is_done: Bool
    var details: String
    var color: UIColor

    internal init(todo: Todo) {
        self.title = todo.title
        self.is_done = todo.is_done
        self.details = todo.detail
        self.color = todo.color
    }

    internal init(title: String, is_done: Bool, details: String, color: UIColor) {
        self.title = title
        self.is_done = is_done
        self.details = details
        self.color = color
    }

    static func initFromAllList(todos: [Todo]) -> [ListPageModel]{
        var listModel = [ListPageModel]()
        for todo in todos {
            listModel.append(ListPageModel(todo: todo))
        }
        return listModel
    }
}
