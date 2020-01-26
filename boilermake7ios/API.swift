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

func submitUser(user: FormData, completion: @escaping (String?, Error?) -> ()) {
    
    let url = URL(string: "https://boilermake-vii.herokuapp.com/api/users/register")!
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
                completion(dataString, nil)
            }
        }
    }
    task.resume()
}
