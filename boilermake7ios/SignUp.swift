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
    @State private var registeredUser: StructUser = StructUser(name: "No Name", email: "No Email", orders: [])
    @State private var isRegistered: Bool = false
    
    var body: some View {
        if (self.isRegistered) {
            return AnyView(Home(user: registeredUser, orders: []))
        } else {
            return AnyView(
                List {
            VStack(alignment: .leading) {
                //Rectangle().foregroundColor(Color.white)
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
                }
                
                //added
                  HStack {
                      Spacer()
                      Button(action: {
                          print("Btn Clicked")
                        submitUser(user: FormData(email: self.email.lowercased(), password: self.password, password2: self.password2, name: self.name)) {(userData, error) in
                              if let error = error {
                                  print(error)
                              }
                            self.registeredUser = userData!
                            self.isRegistered = true
                              
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
                
                Spacer()
            })
            //.edgesIgnoringSafeArea(.top))
        }
    }
    
    struct signupBtn: View {
        @State private var signedUp: Bool = false
        
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
                        self.signedUp = true
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
        init(formData: FormData, completion: @escaping (Bool?, Error?)->()) {
            self.formData = formData
            if (signedUp) {
                completion(true, nil)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

