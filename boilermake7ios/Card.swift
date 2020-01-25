//
//  Card.swift
//  boilermake7ios
//
//  Created by Chirayu Garg on 1/25/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

//extension Color {
//    static let oldPrimaryColor = Color(UIColor.systemIndigo)
//    static let newPrimaryColor = Color("color”)
//}

struct Card: View {
    var body: some View {

                ZStack (alignment: .top) {
                Rectangle()
                    .stroke(Color.gray, lineWidth: 4)
                    .frame(width: 380, height: 90)
                    .shadow(radius: 10.0)
                    .cornerRadius(5)
                    .foregroundColor(Color.red)
                    NavigationLink(destination: OrderDetails()) {
                        VStack(alignment: .leading) {
                            HStack {
                            Text("Order Name")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                                .padding([.top, .leading])
                                .foregroundColor(Color.primary)
                            Spacer()
                            }
                            HStack {
                            Text("Vendor")
                            .font(.headline)
                            .foregroundColor(Color.secondary)
                            .multilineTextAlignment(.leading)
                                .padding(.leading)
                            Spacer()
                            }
                            Spacer()
                        }
                        .frame(width: 380, height: 90)
                    }
            }


    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}



//  50


//                        HStack(alignment: .center) {
//                        Spacer()
//                        NavigationLink (destination: orderList()) {
//                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                            Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
//                            }.frame(width: 100, height: 50)
//                                .background(Color.blue)
//                                .foregroundColor(Color.white)
//                            .cornerRadius(10)
//                            //Text("Details")
//                        }
//                        .padding(.trailing)
//                        NavigationLink (destination: orderList()) {
//                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                            Text("Details")
//                            }.frame(width: 100, height: 50)
//                                .background(Color.blue)
//                                .foregroundColor(Color.white)
//                            .cornerRadius(10)
//                        }
//                        .padding(.leading)
//                        .frame(width: 80, height: 20)
//                        Spacer()
//                    }
                    //.padding(.bottom)
                    //Spacer()
