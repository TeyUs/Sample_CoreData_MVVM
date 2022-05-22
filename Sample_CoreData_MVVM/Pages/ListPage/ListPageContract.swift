//
//  ListPageContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 15.05.2022.
//

import Foundation
import UIKit.UIColor
import UIKit.UITableView

protocol ListPageViewControllerProtocol: BaseViewProtocol where ViewModelType: ListPageViewModelProtocol{
    func deleteCell(index: Int)
    func updateCell(index: Int)
    func createCell(index: Int)
}

protocol ListPageViewModelProtocol: BaseViewModelProtocol where ViewType: ListPageViewControllerProtocol, ModelType: ListPageModelProtocol{
//    TableView
    func getDataCount() -> Int
    func getCell(index: Int, tableView: UITableView) -> UITableViewCell

//    Navigation
    func goToAddPage()
    func goToDetailPage(index: Int)

//    Data Action
    func deleteCell(index: Int)
    func updateCell(detailPageModel: DetailPageModel)
    func createCell(listPageModel: ListPageModel)
    func deleteCellForEditingStyle(index: Int)
}

protocol ListPageModelProtocol: BaseModelProtocol{

}
