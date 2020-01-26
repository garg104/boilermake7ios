//
//  SwiftUIView.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 26/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

struct NewOrderView: View {
    var restaurant: String
    @State var qr: Image = Image(systemName: "")
    @State var gotQR: Bool = false
    
    @EnvironmentObject var sessionSettings: SessionSettings
    @State var menuArr = menuListViewModel()
    var arr = [StructMenuItem(id: "5e2d22ac809d0870168d5b33", name: "Faltu", price: 323432434),
    StructMenuItem(id: "5e2d22ea809d0870168d5b35", name: "Italian", price: 223)]
    
    var body: some View {
        if (self.gotQR) {
            return AnyView(qrImg(image: self.qr))
        } else {
            return AnyView(VStack {
                List(arr) { order in
                    MenuCard(info: order)
                        .frame(width: 350.0, height: 90.0)
                }
                Button(action: {
                    let qrImage = generateQRCode(from: self.sessionSettings.currentOrders.description)
                    self.qr = qrImage ?? Image(systemName: "")
                    self.gotQR = true
                    print("QR")
                }) {
                    Text("Get QR")
                }
                .frame(width: 300, height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(20)
            })
        }
    }
}

struct NewOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NewOrderView(restaurant: "McDonalds")
    }
}

struct MenuItemResponse: Codable, Hashable, Identifiable {
    var id: String
    var quantity: Int
}

struct MenuCard: View {
    var info: StructMenuItem
    
    @EnvironmentObject var sessionSettings: SessionSettings
    @State var selection: Int = 1
    @State var isSelected: Bool = false
    @State var color: Color = Color.gray
    @State var location: Int = -1
    
    var body: some View {
                ZStack (alignment: .top) {
                Rectangle()
                    .stroke(self.color, lineWidth: 4)
                    .frame(width: 350.0, height: 90)
                    .shadow(radius: 10.0)
                    .cornerRadius(5)
                    .foregroundColor(Color.red)
                    
                    Button(action: {
                        if (!self.isSelected) {
                            self.sessionSettings.currentOrders.append(MenuItemResponse(id: self.info.id, quantity: self.selection))
                            print("Appended")
                            self.color = Color.green
                            self.location = self.sessionSettings.currentOrders.count - 1
                            self.isSelected = !self.isSelected
                        } else {
                            self.sessionSettings.currentOrders.remove(at: self.location)
                            self.isSelected = !self.isSelected
                            self.color = Color.gray
                        }
                    }) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(info.name)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                                .padding([.top, .leading])
                                .foregroundColor(Color.primary)
                            Spacer()
                            }
                            HStack {
                                Text("$\(info.price)")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                            .multilineTextAlignment(.leading)
                                .padding(.leading)
                            Spacer()
                            }
                            Spacer()
                        }
                        .frame(width: 350, height: 90)
//                        .navigationBarBackButtonHidden(true)

                    }.navigationBarHidden(true)
                    //.hid
            }

    }
}

func getMenu(completion: @escaping ([StructMenuItem]?, Error?) -> ()) {
    
    let url = URL(string: "https://boilermake-vii.herokuapp.com/api/vendors/5e2cf42d72d23f508efe9ea9/menu")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

//    do {
//        request.httpBody = try JSONEncoder().encode(JSONVendor(name: "Subway"))
//    } catch let error {
//        completion(nil, error)
//        print(error.localizedDescription)
//    }
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
                    let items = try JSONDecoder().decode(JSONRes.self, from: data)
                    print("Test")
                    print(items.items[0])
                    let menuData = try JSONDecoder().decode([StructMenuItem].self, from: data)
                    print(menuData[0])
                    completion(menuData, nil)
                } catch let jsonError {
                    completion(nil, jsonError)
                }
            }
        }
    }
    task.resume()
}

struct JSONRes: Codable, Hashable {
    var items: [StructMenuItem]
}

struct JSONVendor: Codable, Hashable {
    var name: String
}

final class menuListViewModel {
    init() {
        fetchMenus()
    }
    
    var menus = [StructMenuItem]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchMenus() {
//        getMenu() {(menuArray, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            self.menus = menuArray ?? [StructMenuItem]()
//        }
        var arr = [StructMenuItem]()
        arr.append(StructMenuItem(id: "5e2d22ac809d0870168d5b33", name: "Faltu", price: 323432434))
        arr.append(StructMenuItem(id: "5e2d22ea809d0870168d5b35", name: "Italian", price: 223))
    }
    
    let didChange = PassthroughSubject<menuListViewModel, Never>()
}

func generateQRCodea(from string: String) -> Image? {
    let data = string.data(using: String.Encoding.ascii)

    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 3, y: 3)

        if let output = filter.outputImage?.transformed(by: transform) {
            let uiImage =  UIImage(ciImage: output)
            let image = Image(uiImage: uiImage)
            return image
        }
    }

    return nil
}

func generateQRCode(from string: String) -> Image? {
   // Get define string to encode
    let myString = "https://pennlabs.org"
    // Get data from the string
    let data = string.data(using: String.Encoding.ascii)
    // Get a QR CIFilter
    guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil}
    // Input the data
    qrFilter.setValue(data, forKey: "inputMessage")
    // Get the output image
    guard let qrImage = qrFilter.outputImage else { return nil }
    // Scale the image
    let transform = CGAffineTransform(scaleX: 10, y: 10)
    let scaledQrImage = qrImage.transformed(by: transform)
    // Do some processing to get the UIImage
    let context = CIContext()
    guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil}
    let uiImage =  UIImage(cgImage: cgImage)
    let image = Image(uiImage: uiImage)
    return image
}
