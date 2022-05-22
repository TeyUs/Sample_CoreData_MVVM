//
//  ListPageTableCellViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit
import CoreData

class ListPageTableCellViewModel: ListPageTableViewCellViewModelProtocol{
    var delegate: ListPageTableViewCell?
    var model: ListPageTableCellModel

    let tableView: UITableView
    let switchChanged: (_ isOn: Bool) -> Void

    internal init(model: ListPageModel, tableView: UITableView, switchChanged: @escaping ((_ isOn: Bool) -> Void)) {
        self.model = ListPageTableCellModel(listPageModel: model)
        self.tableView = tableView
        self.switchChanged = switchChanged
    }
    
    func prepareCell(){
        delegate?.prepareCell(title: model.title, isDone: model.is_done, detail: model.detail, color: model.color)
    }

    func isDoneSwitcherValueChanced(isOn: Bool) {
        if model.is_done != isOn{
            model.is_done = isOn
            model.updateIsDone(isOn: isOn)
            switchChanged(isOn)
        }
    }
}

struct ListPageTableCellModel:  ListPageTableViewCellModelProtocol{
    var title: String
    var is_done: Bool
    var detail: String
    var color: UIColor
    var referance: Todo

    internal init(listPageModel: ListPageModel) {
        title = listPageModel.title
        detail = listPageModel.detail
        is_done = listPageModel.is_done
        color = listPageModel.color
        referance = listPageModel.referance
    }

    func updateIsDone(isOn: Bool){
        referance.is_done = isOn
        appdelegate.saveContext()
    }
}
