//
//  View.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

extension View{
    public func addButtonBorder<S>(_ content:S,width:CGFloat = 1, cornerRadius:CGFloat = 5)-> some View where S:ShapeStyle{
        return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content,lineWidth: width))
    }
}
