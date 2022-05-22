//
//  BaseViewControllerProtocol+StoryBoard.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import UIKit

//extension BaseViewProtocol where Self: UIViewController{
//    static func instantiate() -> Self{
//        let storyboard = UIStoryboard(name: Self.storyboardName, bundle: nil)
//
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: Self.className)  as? Self else {
//            fatalError("Storyboard cannot instantiated")
//        }
//
//        return viewController
//    }
//
//    static func instantiate(withIdentifier identifier: String) -> Self{
//        let storyboard = UIStoryboard(name: Self.storyboardName, bundle: nil)
//
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
//            fatalError("Storyboard cannot instantiated")
//        }
//
//        return viewController
//    }
//}
