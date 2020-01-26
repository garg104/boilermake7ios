//
//  StructMenuItem.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 26/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation

struct StructMenuItem: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var price: Int
}
