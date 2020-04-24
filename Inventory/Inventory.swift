//
//  Inventory.swift
//  Inventory
//
//  Created by Ante Plecas on 4/24/20.
//  Copyright © 2020 Ante Plecas. All rights reserved.
//

import Foundation

struct Product: Codable {
    var id: Int
    var category: String
    var title: String
    var price: Float
    var stockedQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case price
        case stockedQuantity
    }
}

struct Inventory: Codable {
    var status: String
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case status
        case products
    }
}

class InventoryLoader {
    
    class func load(jsonFileName: String) -> Inventory? {
        var inventory: Inventory?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            inventory = try? jsonDecoder.decode(Inventory.self, from: jsonData)
        }
        
        return inventory
    }
}
