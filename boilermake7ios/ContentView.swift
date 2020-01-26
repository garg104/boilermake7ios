//
//  ContentView.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

class SessionSettings: ObservableObject {
    @Published var token = ""
    @Published var currentOrders = [MenuItemResponse]()
}

struct ContentView: View {
    var body: some View {
//        Text("Hello, World")
        //LoginView()
        //
            //Card()

        //
        LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
