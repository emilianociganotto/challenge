//
//  ViewController.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class BusquedaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var heightImage: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }
    
    //MARK: -TextField delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        heightImage.constant = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        heightImage.constant = 150
        textField.resignFirstResponder()
    }
    
    @IBAction func clickContentView(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    @IBAction func clickSearch(_ sender: Any) {
        if !searchTextField.text!.isEmpty{
            ConsumibleService.getConsumible(searchText: searchTextField.text!, handler: { response in
                if let items = response as! [ItemModel]?{
                    if items.count != 0{
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "toItemsTable", sender: items)
                        }
                    }else{
                        print("Error mensaje")
                    }
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemsTable" {
            if let itemsTableViewController = segue.destination as? ItemsTableViewController {
                itemsTableViewController.itemsTable = sender as? [ItemModel]
            }
        }
    }
    
    func lupaAnimate(){
        
    }
    
}



