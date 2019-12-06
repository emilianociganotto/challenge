//
//  ConsumibleService.swift
//  challenge
//
//  Created by Fernando Noya on 04/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import Foundation

class ConsumibleService{
    
    static func getConsumible(searchText: String, handler: @escaping (Any?)->()){
        
        HttpClientApi.instance().makeAPICall(baseUrl: Urls.baseUrl, opKey: Urls.opConsumible, params: searchText, method: .GET, completion: { data, resonse, error in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                if let busquedas = json as? [String : AnyObject]{
                    print("Busquedas json: ", busquedas)
                    /*for sucursal in sucursales {
                        let sucursalModel = SucursalModel()
                        sucursalModel.id = sucursal["id"] as? Int
                        sucursalModel.tiempoEspera = sucursal["tiempoEspera"] as? Int
                        sucursalModel.latitud = sucursal["latitud"] as? Double
                        sucursalModel.longitud = sucursal["longitud"] as? Double
                        sucursalModel.nombre = sucursal["nombre"] as? String
                        sucursalModel.direccion = sucursal["direccion"] as? String
                        sucursalesList.append(sucursalModel)
                    }
                handler(sucursalesList)*/
                }else{
                    print("No se pudo parsear el pedido")
                }
            }catch let jsonError{
                print(jsonError)
            }
        }
            ,failure: { (data, response, error) in
                print(error as Any, "getSucursales")
                
        })
        
    }
}
