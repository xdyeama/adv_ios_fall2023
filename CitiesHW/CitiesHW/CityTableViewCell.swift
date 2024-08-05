//
//  CityTableViewCell.swift
//  CitiesHW
//
//  Created by Beket Barlykov  on 28.10.2023.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CityTableViewCell.self)
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cityLabel.text = "City"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(from city: City){
        cityLabel.text = city.name.capitalized
        cityImage.load(url: city.url!)
    }
    
}
