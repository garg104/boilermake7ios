//
//  Vendors.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct Vendor1: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Image("McDonalds")
        .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 170)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct Vendor1_Previews: PreviewProvider {
    static var previews: some View {
        Vendor1()
    }
}
