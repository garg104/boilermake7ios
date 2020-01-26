//
//  SwiftUIView.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 25/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var registeredUser: StructUser = StructUser(name: "No Name", email: "No Email", orders: [])
    @State private var isRegistered: Bool = false
    @State private var orders: [StructOrder] = []
    
    
    var body: some View {
        if (self.isRegistered) {
            let url = URL(string: "https://boilermake-vii.herokuapp.com/api/orders/user")!
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")

                do {
                    request.httpBody = try JSONEncoder().encode(self.registeredUser)
                } catch let error {
                    print(error.localizedDescription)
                }
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print("error: \(error)")
                    } else {
                        if let response = response as? HTTPURLResponse {
                            print("statusCode: \(response.statusCode)")
                        }
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("data: \(dataString)")
                            
                            //data parsing
                            do {
                                self.orders = try JSONDecoder().decode([StructOrder].self, from: data)
                                //print(userData.name)
                            } catch _ {
                                print("error")
                            }
                        }
                    }
                }
                task.resume()
            return AnyView(Home(user: self.registeredUser, orders: orders))
        } else {
        return AnyView(NavigationView {
        VStack (alignment: .center, spacing: 16.0) {
            Image("logo")
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
                .frame(height: 100)
            
            VStack {
                TextField("Email", text: $email).lineSpacing(10)
                    .padding()
                SecureField("Password", text: $password).lineSpacing(10)
                    .padding()
                
                HStack {
                    NavigationLink(destination:ContentView()) {
                        Text("Forgot Password?")
                    }
                }.padding(.bottom)
                
                Button(action: {
                    print("Btn Clicked")
                    LoginUser(user: LoginFormData(email: self.email.lowercased(), password: self.password)) {(userData, error) in
                          if let error = error {
                              print(error)
                          }
                        self.registeredUser = userData!
                        self.isRegistered = true
                      
                            
                    }

                }) {
                    Text("Login")
                }
                .padding()
                .cornerRadius(10)
                .background(Color.white)
            }
            
            HStack {
                Text("Don't have an account?")
                NavigationLink(destination:SignUpView()) {
                    Text("Sign Up")
                }
            }
            
            }
        //.navigationBarTitle("Sign Up")
        //.navigationBarHidden(true)
        })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
