//
//  qrImg.swift
//  boilermake7ios
//
//  Created by Aakarshit Pandey on 26/01/20.
//  Copyright © 2020 boilermake7ios. All rights reserved.
//

import SwiftUI

struct qrImg: View {
    
    var image: Image
    
    var body: some View {
        VStack {
            Text("Scan the QR to place your order!").font(.title)
            image.frame(width: 200, height: 200).padding()
        }
    }
}

//struct qrImg_Previews: PreviewProvider {
//    static var previews: some View {
//        qrImg()
//    }
//}
