//
//  Todo+CoreDataProperties.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//
//

import Foundation
import CoreData
import UIKit.UIColor


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String
    @NSManaged public var detail: String
    @NSManaged public var is_done: Bool
    @NSManaged public var color: UIColor

}

extension Todo : Identifiable {

}
