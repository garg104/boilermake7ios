//
//  LoginAPI.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/26/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import Foundation
import JWTDecode


struct LoginFormData: Hashable, Codable {
    var email: String
    var password: String
}

struct token: Hashable, Codable {
    var success: Bool
    var token: String
    var user: StructUser
}

func LoginUser(user: LoginFormData, completion: @escaping (StructUser?, Error?) -> ()) {
    
    let url = URL(string: "https://boilermake-vii.herokuapp.com/api/users/login")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    do {
        request.httpBody = try JSONEncoder().encode(user)
    } catch let error {
        completion(nil, error)
        print(error.localizedDescription)
    }
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(nil, error)
            print("error: \(error)")
        } else {
            if let response = response as? HTTPURLResponse {
                print("statusCode: \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("data: \(dataString)")
                
                //data parsing
                do {
                    let userData = try JSONDecoder().decode(StructUser.self, from: data)
                    print(userData.name)
                    completion(userData, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
//                do {
//
//                    let JSONtoken = try JSONDecoder().decode(token.self, from: data)
//                    print("token is \(JSONtoken)")
//                    //let jwt = try decode(jwt: JSONtoken.token)
//                    //print("body is \(jwt.body))")
//                    let userData = try JSONDecoder().decode(JSONtoken.token, from: data)
//                    completion(userData, nil)
//                } catch let jsonError {
//                    completion(nil, jsonError)
//                }
            }
        }
    }
    task.resume()
}



