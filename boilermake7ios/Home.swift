//
//  Home.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Hi, There!")
                    .font(.largeTitle)
                Text("What would you like to eat?")
                    .font(.title)
                    
            }
            //Spacer()
            VStack(alignment: .leading) {
                Text("New Orders")
                    .font(.largeTitle)
                    //.multilineTextAlignment(.leading)
                
                Vendors()
                    .frame(width: 300.0, height: 200.0)
                    .offset(y: -15)
               //Spacer()
            }
            //Spacer()
            VStack(alignment: .leading) {
                Text("Your Orders")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Card()
                    //.padding(12.0)
                    .frame(width: 380.0, height: 90.0)
                Card()
                //.padding(12.0)
                .frame(width: 380.0, height: 90.0)
                Card()
                //.padding(12.0)
                .frame(width: 380.0, height: 90.0)
                Card()
                //.padding(12.0)
                .frame(width: 380.0, height: 90.0)
                Card()
                //.padding(12.0)
                .frame(width: 380.0, height: 90.0)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
