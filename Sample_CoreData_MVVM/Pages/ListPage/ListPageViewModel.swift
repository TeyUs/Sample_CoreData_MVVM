//
//  ListPageViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit

enum ChangeInCell {
    case deleted(index:Int)
    case updated(detailPageModel: DetailPageModel)
    case created(listPageModel: ListPageModel)
}

final class ListPageViewModel: ListPageViewModelProtocol {

    typealias ViewType = ListPageViewController
    typealias ModelType = ListPageModelList

    weak var delegate: ViewType?
    var model: ListPageModelList

    init() {
        do{
            let todoList = try context.fetch(Todo.fetchRequest())
            model = ListPageModel.initFromAllListAsList(todos: todoList)
        }catch{
            fatalError("noteList cannot fetch")
        }
    }

//    MARK: TableView
    func getDataCount() -> Int {
        model.list.count
    }

    func getCell(index: Int, tableView: UITableView) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = model.list[index].title
//        return cell
        var cellVM = ListPageTableCellViewModel(model: model.list[index], tableView: tableView, switchChanged:{ [weak self] isOn in
            guard var listModel = self?.model.list[index] else{ return }
            listModel.is_done = isOn
            let detailModel = DetailPageModel(listPageModel: listModel, index: index)
            self?.updateCell(detailPageModel: detailModel)
        })
        return cellVM.startCell()
    }

//    MARK: Navigation
    func goToAddPage() {
        var viewModel = NewTodoPageViewModel(refreshCell: splitCallBack(change:))
        let vc = viewModel.startPage()
        delegate?.navigationController?.pushViewController(vc, animated: true)
    }

    func goToDetailPage(index: Int) {
        var viewModel = DetailPageViewModel(listPageModel: model.list[index], index: index, refreshCell: splitCallBack(change:))
        let vc = viewModel.startPage()
        delegate?.navigationController?.pushViewController(vc, animated: true)
    }

//    MARK: Action
    func splitCallBack(change: ChangeInCell){
        switch change {
        case .deleted(let index):
            deleteCell(index: index)
        case .updated(let detailPageModel):
            updateCell(detailPageModel: detailPageModel)
        case .created(let listPageModel):
            createCell(listPageModel: listPageModel)
        }
    }

    func deleteCell(index: Int) {
        model.list.remove(at: index)
        delegate?.deleteCell(index: index)
    }

    func updateCell(detailPageModel: DetailPageModel) {
        model.list[detailPageModel.index] = ListPageModel(detailPageModel: detailPageModel)
        delegate?.updateCell(index: detailPageModel.index)
    }

    func createCell(listPageModel: ListPageModel) {
        model.list.append(listPageModel)
        delegate?.createCell(index: model.list.endIndex - 1 )//model.list.firstIndex(of: data) ?? (model.list.endIndex - 1))
    }

    func deleteCellForEditingStyle(index: Int) {
        context.delete(model.list[index].referance)
        appdelegate.saveContext()
        deleteCell(index: index)
    }
}
