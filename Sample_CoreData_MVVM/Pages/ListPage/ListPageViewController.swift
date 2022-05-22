//
//  ListPageViewController.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import UIKit

class ListPageViewController: UIViewController, ListPageViewControllerProtocol {
    typealias ViewModelType = ListPageViewModel
    static var storyboardName: String = Storyboards.listPage.rawValue
    var viewModel: ViewModelType?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: ListPageTableViewCell.className, bundle: .main), forCellReuseIdentifier: Storyboards.listPageCell.rawValue)
    }


//    MARK: Navigation
    @IBAction func addNewTodo(_ sender: Any) {
        viewModel?.goToAddPage()
    }
    
//    MARK: Action
    func deleteCell(index: Int) {
        let indexpath = IndexPath(item: index, section: 0)
        tableView.deleteRows(at: [indexpath], with: .automatic)
    }

    func updateCell(index: Int) {
        let indexpath = IndexPath(item: index, section: 0)
        tableView.reloadRows(at: [indexpath], with: .automatic)
    }

    func createCell(index: Int) {
        let indexpath = IndexPath(item: index, section: 0)
        tableView.insertRows(at: [indexpath], with: .automatic)
    }
}

extension ListPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getDataCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel?.getCell(index: indexPath.row, tableView: tableView) ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToDetailPage(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            viewModel?.deleteCellForEditingStyle(index: indexPath.row)
        }
    }
}
