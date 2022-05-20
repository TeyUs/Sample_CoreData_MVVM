//
//  DetailPageModel.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 11.05.2022.
//

import Foundation
import CoreData
import UIKit.UIColor

struct DetailPageModel: DetailPageModelProtocol {
    var title: String
    var is_done: Bool
    var detail: String
    var color: UIColor
    var referance: Todo
    var index: Int

    internal init(title: String, is_done: Bool, detail: String, color: UIColor, referance: Todo, index: Int) {
        self.title = title
        self.is_done = is_done
        self.detail = detail
        self.color = color
        self.referance = referance
        self.index = index
    }

    internal init(listPageModel: ListPageModel, index: Int) {
        self.title = listPageModel.title
        self.is_done = listPageModel.is_done
        self.detail = listPageModel.detail
        self.color = listPageModel.color
        self.referance = listPageModel.referance
        self.index = index
    }
}
