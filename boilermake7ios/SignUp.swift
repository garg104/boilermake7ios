//
//  SwiftUIView.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 25/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    
    var body: some View {
         List {
            VStack(alignment: .leading) {
                HStack {
                  Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                }.padding(.top)
                    .frame(height: 120)
                    TextField("Name", text: $name)
                        .padding()
                        .listRowInsets(EdgeInsets())
                    TextField("Email", text: $email)
                        .padding()
                        .listRowInsets(EdgeInsets())
                    TextField("Password", text: $password)
                        .padding()
                        .listRowInsets(EdgeInsets())
                    TextField("Password2", text: $password)
                        .padding()
                        .listRowInsets(EdgeInsets())
//                    Divider()
            }.navigationBarTitle("Sign Up")
            signupBtn()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct signupBtn: View {
    var body: some View {
        
        HStack {
            Spacer()
            Button(action: {}) {
                Text("Sign Up")
            }
            .frame(width: 200, height: 50)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(20)
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
