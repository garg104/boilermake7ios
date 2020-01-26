//
//  StructOrder.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation

struct StructUser: Codable, Hashable, Identifiable {
    var name: String
    var email: String
    var orders: [StructOrder]
    let id: Int
}

