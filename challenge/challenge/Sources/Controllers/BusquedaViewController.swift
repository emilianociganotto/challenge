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
    
    func lupaAnimate(){
        
    }
    
}



