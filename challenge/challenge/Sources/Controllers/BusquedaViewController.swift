//
//  ViewController.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import UIKit

class BusquedaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var heightImage: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchInput.delegate = self
        //MARK: -Consumo de Servicio
        /*ConsumibleService.getSucursales(handler: { response in
            if let getSucursales = response {
                self.sucursales = getSucursales as! [SucursalModel]
                print("Controller sucursal ", self.sucursales)
            }
            DispatchQueue.main.async {
                self.sucursalTableView.reloadData()
            }
        })*/
    }
    
    //MARK: -TextField delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchInput.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        heightImage.constant = 0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        heightImage.constant = 150
        textField.resignFirstResponder()
    }

}



