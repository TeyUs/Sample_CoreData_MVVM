//
//  NewTodoPageViewController.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 12.05.2022.
//

import UIKit

class NewTodoPageViewController: UIViewController, NewTodoPageViewControllerProtocol{
    typealias ViewModelType = NewTodoPageViewModel

    var viewModel: NewTodoPageViewModel?
    static var storyboardName: String = Storyboards.newPage.rawValue

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextView.layer.borderWidth = 1.0
        detailTextView.layer.borderColor = CGColor(gray: 0, alpha: 0.2)
        detailTextView.layer.cornerRadius = 10

        hideKeyboardWhenTappedAround()
    }

//    MARK: Action
    @IBAction func chooseColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.saveData(title: titleTextField.text, detail: detailTextView.text, color: view.backgroundColor ?? .white, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension NewTodoPageViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
    }
}
