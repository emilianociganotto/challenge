//
//  ItemsTableViewController.swift
//  challenge
//
//  Created by Fernando Noya on 05/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class ItemsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    
    var itemsTable: [ItemModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorInset = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            footerView.isHidden = true
            tableView.layer.cornerRadius = 5.0
        }else {
            footerView.isHidden = false
            tableView.layer.cornerRadius = 0.0
        }
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsTable!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        let stringUrl = itemsTable?[indexPath.item].imageUrl ?? ""
        if let imageURL = URL(string: stringUrl){
            cell.imagenCell.load(url: imageURL)
        }
        let precio = String(itemsTable?[indexPath.item].price ?? 0)
        cell.precioLabel.text =  precio + " " + (itemsTable?[indexPath.item].currency ?? "$")
        
        cell.tituloLabel.text = itemsTable![indexPath.item].title
        
        let cantidadDisponible = itemsTable?[indexPath.item].itemsAvailable ?? 0
        cell.stockLabel.text = String(cantidadDisponible) + " disponibles"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetalle", sender: self.itemsTable?[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetalle" {
            if let detalleViewController = segue.destination as? DetalleViewController {
                detalleViewController.itemSelected = sender as? ItemModel
            }
        }
    }
}
