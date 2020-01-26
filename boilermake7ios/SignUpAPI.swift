//
//  File.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 25/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation

struct FormData: Hashable, Codable {
    var email: String
    var password: String
    var password2: String
    var name: String
    
    init(email: String, password: String, password2: String, name: String) {
        self.email = email
        self.password = password
        self.password2 = password2
        self.name = name
    }
}

func submitUser(user: FormData) {
//    let user = FormData(email: "jack@purdue.edu", password: "password", password2: "password", name: "Jack Goel")
//    print("Submit Action Called")
//    //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
//
//    let parameters = ["name": "Aakarshit", "email": "jack@purdue.edu", "password": "password", "password2": "password"]
//
//    //create the url with URL
//    let url = URL(string: "https://boilermake-vii.herokuapp.com/api/users/register")! //change the url
//
//    //create the session object
//    let session = URLSession.shared
//
//    //now create the URLRequest object using the url object
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST" //set http method as POST
//    do {
//        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
//    } catch let error {
//        print(error.localizedDescription)
//    }
//
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//    //create dataTask using the session object to send data to the server
//    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//        guard error == nil else {
//            return
//        }
//
//        guard let data = data else {
//            return
//        }
//
//        do {
//            //create json object from data
//            if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                print(json)
//                // handle json...
//            }
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    })
//    task.resume()
    
    let url = URL(string: "https://boilermake-vii.herokuapp.com/api/users/register")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    let _ parameters = ["name": "Aakarshit", "email": "jack@purdue.edu", "password": "password", "password2": "password"] as [String: Any]
////    do {
////        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
//        } catch let error {
//            print(error.localizedDescription)
//        }
    do {
        request.httpBody = try JSONEncoder().encode(user)
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
            }
        }
    }
    task.resume()
}
