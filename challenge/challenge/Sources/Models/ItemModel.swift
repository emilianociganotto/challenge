//
//  ItemModel.swift
//  challenge
//
//  Created by Nicolas Tosco on 07/12/2019.
//  Copyright © 2019 Ciganotto. All rights reserved.
//

import Foundation

class ItemModel{
    var title: String?
    var price: Float?
    var currency: String?
    var itemsAvailable: Int?
    var imageUrl: String?
    var itemsSold: Int?
    var condition: String?
    var installment: InstallmentModel?
    var address: AddressModel?
    var attributes:  [AttributeModel]?
    
    init() {
    }
}
