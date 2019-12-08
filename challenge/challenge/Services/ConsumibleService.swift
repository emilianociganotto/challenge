//
//  ConsumibleService.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import Foundation
import os

class ConsumibleService{
    
    static func getConsumible(searchText: String, handler: @escaping (Any?)->()){
        
        HttpClientApi.instance().makeAPICall(baseUrl: Urls.baseUrl, opKey: Urls.opConsumible, params: searchText, method: .GET, completion: { data, resonse, error in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                var itemsModel = [ItemModel]()
                if let busquedas = json as? [String : AnyObject]{
                    if let results = busquedas["results"] as? [[String : AnyObject]]{
                        for result in results {
                            let itemModel = ItemModel()
                            itemModel.title = result["title"] as? String
                            itemModel.price = result["price"] as? Float
                            itemModel.currency = result["currency_id"] as? String
                            itemModel.itemsAvailable = result["available_quantity"] as? Int
                            itemModel.itemsSold = result["sold_quantity"] as? Int
                            itemModel.condition = result["condition"] as? String
                            itemModel.imageUrl = result["thumbnail"] as? String
                            
                            let installmentModel = InstallmentModel()
                            if let installments = result["installments"] as? [String : AnyObject]{
                                installmentModel.quantity = installments["quantity"] as? Int
                                installmentModel.amount = installments["amount"] as? Float
                                installmentModel.currency = installments["currency_id"] as? String
                                itemModel.installment = installmentModel
                            }
                            
                            let addressModel = AddressModel()
                            if let address = result["address"] as? [String : AnyObject]{
                                addressModel.cityName = address["city_name"] as? String
                                addressModel.stateName = address["state_name"] as? String
                                itemModel.address = addressModel
                            }
                            
                            var listAttributeModel = [AttributeModel]()
                            if let attributes = result["attributes"] as? [[String : AnyObject]]{
                                for attribute in attributes {
                                    let attributeModel = AttributeModel()
                                    attributeModel.name = attribute["name"] as? String
                                    attributeModel.valueName = attribute["value_name"] as? String
                                    listAttributeModel.append(attributeModel)
                                }
                                if listAttributeModel.count != 0{
                                    itemModel.attributes = listAttributeModel
                                }
                            }
                            itemsModel.append(itemModel)
                        }
                    }
                handler(itemsModel)
                }else{
                    os_log("No se pudo parsear el pedido", type: .info)
                }
            }catch let jsonError{
                os_log("%s.", type: .error, jsonError.localizedDescription)
            }
        }
            ,failure: { (data, response, error) in
                os_log("%s.", type: .error, error.debugDescription)
        })
        
    }
}
