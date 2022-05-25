//
//  DetailPageContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import Foundation
import UIKit.UIColor

protocol DetailPageViewModelProtocol: BaseViewModelProtocol where ViewType: DetailPageViewControllerProtocol, ModelType: DetailPageModelProtocol{
    var refreshCell: (_ change: ChangeInCell) -> () { get }
    func getDataForProperties()
    func updateData(title: String?, detail: String?, color: UIColor, isDone: Bool ,completion: @escaping () -> Void)
    func deleteData(completion: @escaping () -> ())
}

protocol DetailPageViewControllerProtocol: BaseViewProtocol where ViewModelType: DetailPageViewModelProtocol{
    func prepareProperties(title: String, isDone: Bool, detail: String, color: UIColor)
}

protocol DetailPageModelProtocol: BaseModelProtocol{
    func updateModel()
    func deleteModel()
}
