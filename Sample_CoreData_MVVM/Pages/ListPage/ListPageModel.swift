//
//  ListPageModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UIColor

struct ListPageModelList: ListPageModelProtocol{
    var list = [ListPageModel]() // Array<ListPageModel>()//
}

struct ListPageModel: ListPageModelProtocol {
    var title: String
    var is_done: Bool
    var detail: String
    var color: UIColor
    var referance: Todo

    internal init(todo: Todo) {
        self.title = todo.title
        self.is_done = todo.is_done
        self.detail = todo.detail
        self.color = todo.color
        self.referance = todo.self
    }

    internal init(title: String, is_done: Bool, details: String, color: UIColor) {
        self.title = title
        self.is_done = is_done
        self.detail = details
        self.color = color
        self.referance = Todo(context: context)
    }

    internal init(detailPageModel: DetailPageModel) {
        self.title = detailPageModel.title
        self.is_done = detailPageModel.is_done
        self.detail = detailPageModel.detail
        self.color = detailPageModel.color
        self.referance = detailPageModel.referance
    }

    internal init(newTodoPageModel: NewTodoPageModel) {
        self.title = newTodoPageModel.title
        self.is_done = false
        self.detail = newTodoPageModel.detail
        self.color = newTodoPageModel.color
        self.referance = newTodoPageModel.referance!
    }

    static func initFromAllList(todos: [Todo]) -> [ListPageModel]{
        var listModel = [ListPageModel]()
        for todo in todos {
            listModel.append(ListPageModel(todo: todo))
        }
        return listModel
    }

    static func initFromAllListAsList(todos: [Todo]) -> ListPageModelList{
        var listModel = [ListPageModel]()
        for todo in todos {
            listModel.append(ListPageModel(todo: todo))
        }
        let listPageModelList = ListPageModelList(list: listModel)
        return listPageModelList
    }
}
