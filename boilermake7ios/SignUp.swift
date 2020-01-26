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
    @State private var isRegistered: Bool = false
    
    var body: some View {
         List {
            VStack(alignment: .leading) {
                Rectangle().foregroundColor(Color.white)
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
                    SecureField("Password", text: $password)
                        .padding()
                        .listRowInsets(EdgeInsets())
                    SecureField("Confirm Password", text: $password2)
                        .padding()
                        .listRowInsets(EdgeInsets())
//                    Divider()
                signupBtn(formData: FormData(email: email, password: password, password2: password2, name: name))
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    struct signupBtn: View {
        @State private var message: String = ""
        
        var formData: FormData
        var body: some View {
            HStack {
                Spacer()
                Button(action: {
                    print("Btn Clicked")
                    submitUser(user: self.formData) {(userData, error) in
                        if let error = error {
                            print(error)
                        }
                        print(userData ?? "JSON Malformed")
                    }
                }) {
                    Text("Sign Up")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(20)
                Spacer()
            }
        }
//        init(formData: FormData, completion: @escaping (Bool?, Error?)->()) {
//            self.formData = formData
//            
//        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

