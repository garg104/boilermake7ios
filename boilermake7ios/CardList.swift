//
//  CardList.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/26/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct CardList: View {
    var orders: [StructOrder]
    var body: some View {
        List(orders) { order in
            Card(info: StructCard(title: order.title, vendor: order.vendor))
            .frame(width: 350.0, height: 90.0)
        }
        
    }
}

//struct CardList_Previews: PreviewProvider {
//    static var previews: some View {
//        CardList(order: orders)
//    }
//}
