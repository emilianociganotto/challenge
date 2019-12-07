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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        cell.imagenCell.image = UIImage(named: "image-lupa")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetalle", sender: nil)
    }
}
