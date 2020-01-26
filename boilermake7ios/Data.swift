//
//  Data.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

//import Foundation
//import SwiftUI
//import Combine
//
//public class MovieFetcher: ObservableObject {
//
//    @Published var movies = [Movie]()
//
//    init(){
//        load()
//    }
//
//    func load() {
//        let url = URL(string: "https://boilermake-vii/herokuspp.com/api/orders/")!
//
//        URLSession.shared.dataTask(with: url) {(data,response,error) in
//            do {
//                if let d = data {
//                    let decodedLists = try JSONDecoder().decode([Movie].self, from: d)
//                    DispatchQueue.main.async {
//                        self.movies = decodedLists
//                    }
//                }else {
//                    print("No Data")
//                }
//            } catch {
//                print ("Error")
//            }
//
//        }.resume()
//
//    }
//}
//
//struct Movie: Decodable, Hashable {
//
//    var title: String
//    var vendor: String
//    var items: [Items]
//}
//
//struct Items: Decodable, Hashable {
//
//    var itemID: String
//    var quantity: Int
//}
