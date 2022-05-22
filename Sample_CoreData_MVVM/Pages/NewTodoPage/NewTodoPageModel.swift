//
//  NewTodoPageModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import Foundation
import UIKit.UIColor
import CoreData

struct NewTodoPageModel: NewTodoPageModelProtocol {
    var title: String
    var detail: String
    var color: UIColor
    var referance: Todo?

    internal init(title: String, detail: String, color: UIColor, withCoreData: Bool = true) {
        if withCoreData{
            let todo = Todo(context: context)

            todo.title = title
            todo.detail = detail
            todo.is_done = false
            todo.color = color
            appdelegate.saveContext()
            self.referance = todo
        }
        self.title = title
        self.detail = detail
        self.color = color
    }
}
