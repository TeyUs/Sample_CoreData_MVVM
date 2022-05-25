//
//  DetailPageViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 11.05.2022.
//

import Foundation
import UIKit.UIColor

final class DetailPageViewModel: DetailPageViewModelProtocol{
    typealias ViewType = DetailPageViewController
    typealias ModelType = DetailPageModel

    weak var delegate: ViewType?
    var model: ModelType

    var refreshCell: (_ change: ChangeInCell) -> ()

    internal init(listPageModel: ListPageModel, index: Int, refreshCell: @escaping (ChangeInCell) -> ()) {
        self.model = DetailPageModel(listPageModel: listPageModel, index: index)
        self.refreshCell = refreshCell
    }

    func getDataForProperties(){
        delegate?.prepareProperties(title: model.title, isDone: model.is_done, detail: model.detail, color: model.color)
    }

    func updateData(title: String?, detail: String?, color: UIColor, isDone: Bool, completion: @escaping () -> Void){
        var is_changed = false
        if let title = title, title != model.title{
            model.title = title
            is_changed = true
        }
        if let detail = detail, detail != model.detail{
            model.detail = detail
            is_changed = true
        }
        if color != model.color{
            model.color = color
            is_changed = true
        }
        if isDone != model.is_done{
            model.is_done = isDone
            is_changed = true
        }
        if is_changed {
            model.updateModel()
            refreshCell(.updated(detailPageModel: model))
        }
        completion()
    }

    func deleteData(completion: @escaping () -> ()){
        model.deleteModel()
        refreshCell(.deleted(index: model.index))
        completion()
    }
}
