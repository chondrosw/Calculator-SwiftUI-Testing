//
//  DisplayView.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct DisplayView:View{
    @Binding var display:String
    var body: some View{
        let _ = Self._printChanges()
        
        HStack{
            if display.isEmpty{
                Text("0").accessibilityIdentifier("display")
                    .padding(.horizontal,5)
                    .frame(maxWidth:.infinity,alignment: .trailing).overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2).foregroundColor(.gray))
            }else{
                Text(display).accessibilityIdentifier("display")
                    .padding(.horizontal,5)
                    .frame(maxWidth:.infinity,alignment: .trailing)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2).foregroundColor(.gray))
            }
        }.background(Color.random)
    }
}
