//
//  ListPageTableViewCellContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 21.05.2022.
//

import Foundation
import UIKit.UITableView
import MVVMBaseProtocols

protocol ListPageTableViewCellProtocol: BaseViewCellProtocol where ViewModelType: ListPageTableViewCellViewModelProtocol {
    func requestAttributes()
    func prepareCell(title: String, isDone: Bool, detail: String, color: UIColor)
}

protocol ListPageTableViewCellViewModelProtocol: BaseViewModelCellProtocol where ViewType: ListPageTableViewCellProtocol, ModelType: ListPageTableViewCellModelProtocol {
    var switchChanged: (_ isOn: Bool) -> Void { get }
    func prepareCell()
    func isDoneSwitcherValueChanced(isOn: Bool)
}

protocol ListPageTableViewCellModelProtocol: BaseModelProtocol {
    func updateIsDone(isOn: Bool)
}
