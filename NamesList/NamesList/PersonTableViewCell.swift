//
//  personTableViewCell.swift
//  NamesList
//
//  Created by Beket Barlykov  on 05.10.2023.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    static let identifier = "PersonTableViewCell"
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
