//
//  CalcButtonStyle.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct CalcButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.frame(width: 45, height: 45)
            .addButtonBorder(Color.gray)
            .background(
                RadialGradient(colors: [Color.white,Color.gray], center: .center, startRadius: 0, endRadius: 80))
        
    }
}
