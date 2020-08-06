//
//  ContentView.swift
//  Calculator Demo
//
//  Created by djing on 2020/8/5.
//  Copyright © 2020 djing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var calcModel : CalculatorViewModel
    var body: some View {
        VStack(spacing: 16){
            Text(calcModel.display).font(.system(size: 80))
            HStack(spacing: 16){
                CalcPadNums()
                Operator()
            }
        }
    }
    
}


struct CalcPadNums: View {
    @EnvironmentObject var calcModel : CalculatorViewModel
    let pad = [
        [7, 8, 9],
    [4, 5, 6],
    [1, 2, 3],
    [0]]
    var body: some View {
        VStack(spacing: 8){
            ForEach(pad, id:\.self){row in
                HStack(spacing: 8){
                    ForEach(row, id: \.self){ digit in
                        Button("\(digit)", action: {
                            print("digit \(digit) pressed")
                            if(self.calcModel.typInMiddle){
                                self.calcModel.display.append(String(digit))
                                
                            }else{
                                self.calcModel.display = String(digit)
                                self.calcModel.typInMiddle = true
                            }
                            
                        })
                        .frame(width: 100, height: 100)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.system(size: 38, weight: .bold))
                        .cornerRadius(50)
                        
                    }
                }
            }
        }
    }
}

struct Operator : View{
    @EnvironmentObject var calcModel : CalculatorViewModel
    let opCu:[[OpCu]] = [
        [.clean, .plus, .minus , .multiply ,.divide],
        [.equal]
    ]
    var body: some View {
        HStack(spacing:8){
            ForEach(opCu, id: \.self){rows in
                VStack(spacing: 8){
                    ForEach(rows, id: \.self){ op in
                        Button(op.rawValue ,action: {
                            print("op \(op) pressed")
                            if(op.rawValue == "AC"){
                                self.calcModel.display = "0"
                                self.calcModel.typInMiddle = false
                            }
                            
                        })
                        .frame(width: 100, height: 100)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.system(size: 38, weight: .bold))
                        .cornerRadius(50)
                        
                    }
                }
            }
        }
    }
}



struct CalulatorPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.digit(7), .digit(8), .digit(9), .op(.plus)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.multiply)],
        [.digit(0), .dot ,.op(.divide), .op(.equal)]
    ]
    var body : some View {
        VStack(spacing: 8){
            ForEach(pad, id: \.self){ row in
                CalculatorButtonRow(row: row)
            }
        }
    }
    
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self){item in
                CalculatorButton(title: item.title){
                    print("buttom: \(item.title)")
                    
                }
            }
        }
    }
}


struct CalculatorButton: View {
    let fontSize: CGFloat = 68
    let title: String
    //    let backgroundColorName: String
    let action: ()->Void
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: 88, height: 88)
                .background(Color.orange)
                .cornerRadius(50)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorViewModel())
    }
}
