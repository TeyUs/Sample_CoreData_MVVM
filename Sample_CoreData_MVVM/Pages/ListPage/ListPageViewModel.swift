//
//  ListPageViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UITableView
import UIKit.UITableViewCell

protocol TableViewProtocol {
    func getDataCount() -> Int
    func getCellContext(index:Int, tableView: UITableView) -> UITableViewCell
}

class ListPageViewModel: BaseViewModelProtocol {
    var delegate: BaseViewProtocol?
    var model = [ListPageModel]()

    func startPage() -> BaseViewProtocol {
        let viewController = ListPageViewController.instantiate()
        fetchAllData()
        self.delegate = viewController
        viewController.viewModel = self
        viewController.tableViewDelegate = self
        return viewController
    }

    private func fetchAllData(){
        do{
            let todoList = try context.fetch(Todo.fetchRequest())
            model = ListPageModel.initFromAllList(todos: todoList)
        }catch{
            fatalError("noteList cannot fetch")
        }
//        let todo = Todo(context: context)
//        todo.title = "nikki"
//        todo.detail = "SelamunHelloSelamunHello\nSelamunHello\nSelamunHelloSelamunHello\nSelamunHello"
//        todo.is_done = false
//        todo.color = .yellow
//        appdelegate.saveContext()
    }

    
}

extension ListPageViewModel: TableViewProtocol{
    func getDataCount() -> Int {
        model.count
    }

    func getCellContext(index: Int, tableView: UITableView) -> UITableViewCell {
        let cell = ListPageTableCellViewModel(model: model[index]).start(tableView: tableView)
        return cell
    }
}
