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

        hideKeyboardWhenTappedAround()
        viewModel?.getDataForProperties()
    }

    func prepareProperties(title: String, isDone: Bool, detail: String, color: UIColor){
        titleTextField.text = title
        isDoneSwitch.isOn = isDone
        detailTextView.text = detail
        view.backgroundColor = color
    }

//    MARK: Action
    @IBAction func chooseColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    @IBAction func deleteBtn(_ sender: Any) {
        viewModel?.deleteData(completion:{
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func updateTodo(_ sender: Any) {
        viewModel?.updateData(title: titleTextField.text,
                              detail: detailTextView.text,
                              color: view.backgroundColor ?? .white,
                              isDone: isDoneSwitch.isOn,
                              completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension DetailPageViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
    }
}
