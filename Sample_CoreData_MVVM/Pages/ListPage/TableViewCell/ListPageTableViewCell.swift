//
//  ListPageTableViewCell.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import UIKit

final class ListPageTableViewCell: UITableViewCell, ListPageTableViewCellProtocol {
    var viewModel: ListPageTableCellViewModel?
    static var storyboardName: String = Storyboards.listPageCell.rawValue

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var isDoneSwitch: UISwitch!
    @IBOutlet var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        isDoneSwitch.subviews[0].subviews[0].backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func requestAttributes(){
        viewModel?.prepareCell()
    }

    func prepareCell(title: String, isDone: Bool, detail: String, color: UIColor){
        titleLabel.text = title
        isDoneSwitch.isOn = isDone
        detailLabel.text = detail
        colorView.backgroundColor = color
    }
    
    @IBAction func isDoneSwitcherChanged(_ sender: UISwitch) {
        viewModel?.isDoneSwitcherValueChanced(isOn: sender.isOn)
    }
}
