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
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
    var itemSelected: ItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cuotasImage.tintColor = #colorLiteral(red: 0, green: 0.6956505179, blue: 0.3868542314, alpha: 1)
        setWindowAttributes()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.separatorInset = .zero
        tableHeightConstraint.constant = CGFloat(44*(itemSelected?.attributes?.count ?? 0))
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            rightConstraint.constant = 60
        }else {
            rightConstraint.constant = 20
        }
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemSelected?.attributes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "caracteristicaCell", for: indexPath) as! CaracteristicasItemTableViewCell
        if indexPath.item % 2 == 0 {
            cell.cellContentView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        }else {
            cell.cellContentView.backgroundColor = UIColor.white
        }
        cell.firstLabel.text = itemSelected?.attributes?[indexPath.item].name
        cell.secondLabel.text = itemSelected?.attributes?[indexPath.item].valueName
        return cell
    }
    
    // MARK: - Window Attributes
    func setWindowAttributes(){
        let stringUrl = (itemSelected?.imageUrl)!
        let imageURL = URL(string: stringUrl)!
        mainImage.load(url: imageURL)
        itemsSold.text = String(itemSelected?.itemsSold ?? 0) + " vendidos"
        titleLabel.text = itemSelected?.title
        priceLabel.text = String(itemSelected?.price ?? 0) + " " + (itemSelected?.currency ?? "$")
        availableItems.text = String(itemSelected?.itemsAvailable ?? 0) + " disponibles"
        if(itemSelected?.installment != nil){
            cuotasLabel.text = "Paga en \(itemSelected?.installment?.quantity ?? 0) cuotas de \(String(itemSelected?.installment?.amount ?? 0))\(itemSelected?.installment?.currency ?? "")"
            cuotasImage.isHidden = false
            cuotasLabel.isHidden = false
        }
        addressLabel.text = (itemSelected?.address?.cityName ?? "") + ", " + (itemSelected?.address?.stateName ?? "")
    }
    
}
