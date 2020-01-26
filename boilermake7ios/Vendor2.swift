//
//  Vendor2.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct Vendor2: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationLink(destination: OrderDetails()) {

        Image("Subway")
        .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
        .frame(width: 320, height: 170)
        .cornerRadius(10)
        .shadow(radius: 10)
        }
    }
}

struct Vendor2_Previews: PreviewProvider {
    static var previews: some View {
        Vendor2()
    }
}
