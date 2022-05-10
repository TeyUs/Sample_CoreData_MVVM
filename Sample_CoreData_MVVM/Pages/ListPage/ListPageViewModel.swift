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
        self.delegate = viewController
        viewController.viewModel = self


        return viewController
    }
    
}

extension ListPageViewModel: TableViewProtocol{
    func getDataCount() -> Int {
        model.count
    }

    func getCellContext(index: Int, tableView: UITableView) -> UITableViewCell {
        UITableViewCell()
    }


}
