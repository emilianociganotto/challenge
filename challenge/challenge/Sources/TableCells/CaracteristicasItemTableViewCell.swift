//
//  CaracteristicasItemTableViewCell.swift
//  challenge
//
//  Created by Fernando Noya on 06/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class CaracteristicasItemTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
