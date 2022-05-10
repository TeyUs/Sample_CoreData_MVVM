//
//  ListPageViewController.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import UIKit

class ListPageViewController: BaseViewProtocol {
    static var storyboardName: String = Storyboards.listPage.rawValue
    var viewModel: BaseViewModelProtocol?

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: ListPageTableViewCell.className, bundle: .main), forCellReuseIdentifier: Storyboards.listPageCell.rawValue)
    }
}

extension ListPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboards.listPageCell.rawValue) as! ListPageTableViewCell
        cell.label?.text = "nikkki"
        return cell
    }


}
