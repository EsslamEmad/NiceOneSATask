//
//  Product.swift
//  NiceOneSATask
//
//  Created by Esslam Emad on 6/10/21.
//

import Foundation


struct Product: Decodable{
    
    let id: String
    let thumb: String
    let name: String
    let manufacturerName: String
    let totalPriceString: String
    let quantity: String
    
    enum CodingKeys: String, CodingKey{
        case name, thumb, quantity
        case id = "product_id"
        case manufacturerName = "manufacturer_name"
        case totalPriceString = "total_formatted"
    }
}
