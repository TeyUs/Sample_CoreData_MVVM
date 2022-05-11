//
//  ListPageTableViewCell.swift
//  Sample_CoreData_MVVM
//
//  Created by teyhan.uslu on 10.05.2022.
//

import UIKit

class ListPageTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var isDoneSwitch: UISwitch!
    @IBOutlet var colorView: UIView!

    var viewModel: ListPageTableCellViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        isDoneSwitch.subviews[0].subviews[0].backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(model: ListPageModel){
        titleLabel.text = model.title
        detailLabel.text = model.details
        isDoneSwitch.isOn = model.is_done
        colorView.backgroundColor = model.color
    }
}
