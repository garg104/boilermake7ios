//
//  StructItems.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/26/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation


struct Items: Identifiable, Codable, Hashable {
    var itemID: String
    var quantity: Int
    let id: Int
}
