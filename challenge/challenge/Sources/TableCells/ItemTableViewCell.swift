//
//  TableViewCell.swift
//  challenge
//
//  Created by Fernando Noya on 05/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenCell: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
