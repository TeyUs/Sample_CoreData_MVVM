//
//  ListPageTableCellViewModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import Foundation
import UIKit.UITableView

class ListPageTableCellViewModel{
    var delegate: ListPageTableViewCell?
    var model: ListPageModel

    internal init(model: ListPageModel) {
        self.model = model
    }

    func start(tableView: UITableView) -> ListPageTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboards.listPageCell.rawValue) as! ListPageTableViewCell
        cell.configureCell(model: model)
        cell.viewModel = self
        return cell
    }
}
