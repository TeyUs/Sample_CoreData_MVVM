//
//  ListPageTableViewCellContract.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 21.05.2022.
//

import Foundation
import UIKit.UITableView

protocol ListPageTableViewCellProtocol: BaseViewCellProtocol where ViewModelType: ListPageTableViewCellViewModelProtocol {

}

protocol ListPageTableViewCellViewModelProtocol: BaseViewModelCellProtocol where ViewType: ListPageTableViewCellProtocol, ModelType: ListPageTableViewCellModelProtocol {
}

protocol ListPageTableViewCellModelProtocol: BaseModelProtocol {

}
