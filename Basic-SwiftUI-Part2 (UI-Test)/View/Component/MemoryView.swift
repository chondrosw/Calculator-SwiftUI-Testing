//
//  MemoryView.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct MemoryView:View{
    @Binding var memory:Double
    var geometry:GeometryProxy
    var body: some View{
        let memorySwipe = DragGesture(minimumDistance: 20).onEnded{ _ in
            memory = 0.0
        }
        
        HStack{
            Spacer()
            Text("\(memory)").accessibilityIdentifier("memoryDisplay")
                .padding(.horizontal,5)
                .frame(width:geometry.size.width * 0.85,alignment: .trailing)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2).foregroundColor(.gray))
                .gesture(memorySwipe)
            Text("M")
        }.padding(.bottom).padding(.horizontal,5)
    }
}
