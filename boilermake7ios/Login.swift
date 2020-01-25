//
//  SwiftUIView.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 25/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 16.0) {
            Image("logo")
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
                .frame(height: 100)
            
            VStack {
                TextField("Email", text: $email).lineSpacing(10)
                    .padding()
                TextField("Password", text: $password).lineSpacing(10)
                    .padding()
                
                HStack {
                    NavigationLink(destination:ContentView()) {
                        Text("Forgot Password?")
                    }
                }.padding(.bottom)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
                }
                .padding()
                .cornerRadius(10)
                .background(Color.white)
            }
            
            HStack {
                Text("Don't have an account?")
                NavigationLink(destination:ContentView()) {
                    Text("Sign Up")
                }
            }
            
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
