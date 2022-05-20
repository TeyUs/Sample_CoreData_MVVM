//
//  DetailPageViewController.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 11.05.2022.
//

import UIKit

class DetailPageViewController: UIViewController, DetailPageViewControllerProtocol{
    typealias ViewModelType = DetailPageViewModel

    var viewModel: ViewModelType?

    static var storyboardName: String = Storyboards.detailPage.rawValue

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isDoneSwitch: UISwitch!
    @IBOutlet var detailTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        isDoneSwitch.subviews[0].subviews[0].backgroundColor = .secondarySystemBackground
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.borderColor = CGColor(gray: 0, alpha: 0.2)
        detailTextView.layer.cornerRadius = 10

        viewModel?.getDataForProperties()
    }

    @IBAction func chooseColor(_ sender: Any) {
        
    }
    @IBAction func updateTodo(_ sender: Any) {

    }

    func prepareProperties(title: String, isDone: Bool, detail: String, color: UIColor){
        titleTextField.text = title
        isDoneSwitch.isOn = isDone
        detailTextView.text = detail
        view.backgroundColor = color
    }

}
