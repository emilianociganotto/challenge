//
//  DetalleViewController.swift
//  challenge
//
//  Created by Fernando Noya on 06/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var itemsSold: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availableItems: UILabel!
    @IBOutlet weak var cuotasLabel: UILabel!
    @IBOutlet weak var cuotasImage: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    var caracteristicas = ["Motorola", "G6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.separatorInset = .zero
        tableHeightConstraint.constant = CGFloat(44*caracteristicas.count)
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "caracteristicaCell", for: indexPath) as! CaracteristicasItemTableViewCell
        if indexPath.item % 2 == 0 {
            cell.cellContentView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
            cell.firstLabel.text = "Marca"
        }else {
            cell.cellContentView.backgroundColor = UIColor.white
            cell.firstLabel.text = "Modelo"
        }
        cell.secondLabel.text = caracteristicas[indexPath.item]
        return cell
    }
    
}
