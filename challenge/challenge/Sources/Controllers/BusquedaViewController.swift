//
//  ViewController.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class BusquedaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        activityIndicator.isHidden = true
    }
    
    //MARK: -TextField delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorLabel.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    @IBAction func clickContentView(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    @IBAction func clickSearch(_ sender: Any) {
        searchTextField.endEditing(true)
        startActivityAnimation()
        if !searchTextField.text!.isEmpty{
            ConsumibleService.getConsumible(searchText: searchTextField.text!, handler: { response in
                if let items = response as! [ItemModel]?{
                    if items.count != 0{
                        DispatchQueue.main.async {
                            self.endActivityAnimation()
                            self.performSegue(withIdentifier: "toItemsTable", sender: items)
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.endActivityAnimation()
                            self.errorLabel.text = "Error al realizar búsqueda"
                        }
                    }
                }
            })
        }else{
            endActivityAnimation()
            errorLabel.text = "Campo de búsqueda vacio"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemsTable" {
            if let itemsTableViewController = segue.destination as? ItemsTableViewController {
                itemsTableViewController.itemsTable = sender as? [ItemModel]
            }
        }
    }
    
    func startActivityAnimation(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func endActivityAnimation(){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
}



