//
//  CardList.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/26/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct CardList: View {
    var order: [StructOrder]
    var body: some View {
        Card(info: StructCard(title: order[0].title, vendor: order[0].vendor))
            .frame(width: 350.0, height: 90.0)
    }
}

//struct CardList_Previews: PreviewProvider {
//    static var previews: some View {
//        CardList(order: orders)
//    }
//}
