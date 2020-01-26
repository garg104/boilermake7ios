//
//  StructOrder.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation

struct StructOrder: Codable, Hashable {
    
    var title: String
    var vendor: String
    var items: [Items]
}

struct Items: Codable, Hashable {
    var itemID: String
    var quantity: Int
}

