//
//  TableViewCell.swift
//  AboutMe
//
//  Created by Камила Багдат on 13.02.2025.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var hobbyImageView: UIImageView!
    @IBOutlet weak var hobbyNameLabel: UILabel!
    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
