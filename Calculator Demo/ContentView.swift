//
//  ContentView.swift
//  Calculator Demo
//
//  Created by djing on 2020/8/5.
//  Copyright © 2020 djing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16){
        Text("0").font(.system(size: 80))
        CalulatorPad()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
