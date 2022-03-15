//
//  SwiftCalView.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI
enum Operator{
    case none
    case add
    case subtract
    case multiply
    case divide
}
struct SwiftCalView:View{
    @State private var accumulator = 0.0
    @State private var display = ""
    @State private var memory = 0.0
    @State private var pendingOperation:Operator = .none
    @State private var displayChange = false
    
    func addDisplayText(_ digit:String){
        if displayChange{
            display = "\(digit)"
            displayChange = false
        }else{
            display += digit
        }
    }
    func doOperation(_ opr:Operator){
        let val = Double(display) ?? 0.0
        switch pendingOperation {
        case .none:
            accumulator = val
        case .add:
            accumulator += val
        case .subtract:
            accumulator -= val
        case .multiply:
            accumulator *= val
        case .divide:
            accumulator /= val
        }
        displayChange = true
        pendingOperation = opr
        display = "\(accumulator)"
    }
    
    let calculatorColumns = [
        GridItem(.fixed(45),spacing: 10),
        GridItem(.fixed(45),spacing: 10),
        GridItem(.fixed(45),spacing: 10),
        GridItem(.fixed(45),spacing: 10),
        GridItem(.fixed(45),spacing: 10),
    ]
    var body: some View{
        GeometryReader{geometry in
            LazyVStack{
                DisplayView(display: $display).padding(.horizontal,7)
                    .padding()
                if memory != 0.0{
                    MemoryView(memory: $memory, geometry: geometry)
                        .padding(.bottom)
                        .padding(.horizontal,5)
                }
                LazyVGrid(columns: calculatorColumns,spacing:10){
                   
                    Group{
                        
                        Group{
                            Button(action: {
                                memory = 0.0
                            }, label: {Text("MC")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                display = "\(memory)"
                            }, label: {Text("MR")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                if let val = Double(display){
                                    memory += val
                                    display = ""
                                    pendingOperation = .none
                                }else{
                                    display = ""
                                }
                            }, label: {Text("M+")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                display = ""
                            }, label: {Text("C")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                display = ""
                                accumulator = 0.0
                                memory = 0.0
                            }, label: {Text("AC")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                let val = Double(display) ?? 0.0
                                let root = sqrt(val)
                                display = "\(root)"
                            }, label: {Text("√")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("7")
                            }, label: {Text("7")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("8")
                            }, label: {Text("8")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("9")
                            }, label: {Text("9")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                doOperation(.divide)
                            }, label: {Text("÷")}).buttonStyle(CalcButtonStyle())
                            
                            
                        }
                        Group{
                            Button(action: {
                                display = "\(Double.pi)"
                            }, label: {Text("π")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("4")
                            }, label: {Text("4")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("5")
                            }, label: {Text("5")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("6")
                            }, label: {Text("6")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                doOperation(.multiply)
                            }, label: {Text("x")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                let val = Double(display)
                                let root = 1.0 / val!
                                display = "\(root)"
                            }, label: {Text("1/x")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                               addDisplayText("1")
                            }, label: {Text("1")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                               addDisplayText("2")
                            }, label: {Text("2")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                               addDisplayText("3")
                            }, label: {Text("3")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                doOperation(.subtract)
                            }, label: {Text("-")}).buttonStyle(CalcButtonStyle())
                            
                           
                            
                        }
                        Group{
                            Button(action: {
                                let val = Double(display) ?? 0.0
                                display = "\(-val)"
                            }, label: {Text("+-")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                if !display.contains("."){
                                    addDisplayText(".")
                                }
                            }, label: {Text(".")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                addDisplayText("0")
                            }, label: {Text("0")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                doOperation(.none)
                            }, label: {Text("=")}).buttonStyle(CalcButtonStyle())
                            Button(action: {
                                doOperation(.add)
                            }, label: {Text("+")}).buttonStyle(CalcButtonStyle())
                            
                        }
                    }
                }.font(.title)
                
            }.background(LinearGradient(colors: [
                Color(red: 0.161, green: 0.502, blue: 0.725),
                            Color(red: 0.427, green: 0.835, blue: 0.98),
                Color.white],startPoint: .bottomTrailing, endPoint: .topLeading).ignoresSafeArea().frame(height:UIScreen.main.bounds.size.height,alignment: .center).position(x: geometry.size.width / 2, y: geometry.size.height / 2))
            
        }
    }
}
