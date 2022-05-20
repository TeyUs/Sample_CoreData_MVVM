//
//  DetailPageViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 11.05.2022.
//

import Foundation
import UIKit.UIColor

class DetailPageViewModel: DetailPageViewModelProtocol{
    typealias ViewType = DetailPageViewController
    typealias ModelType = DetailPageModel

    var delegate: ViewType?
    var model: ModelType

    var refreshCell: ((_ change: ChangeInCell) -> ())

    internal init(listPageModel: ListPageModel, index: Int, refreshCell: @escaping ((ChangeInCell) -> ())) {
        self.model = DetailPageModel(listPageModel: listPageModel, index: index)
        self.refreshCell = refreshCell
    }

    func getDataForProperties(){

    }
    func updateData(title: String?, detail: String?, color: UIColor, isDone: Bool ,completion: @escaping (() -> Void) ){

    }
    func deleteData(){
        
    }
}
