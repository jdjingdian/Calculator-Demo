//
//  CalculatorButtonItem.swift
//  Calculator Demo
//
//  Created by djing on 2020/8/5.
//  Copyright © 2020 djing. All rights reserved.
//

import Foundation

enum CalculatorButtonItem{
    enum Op: String{
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    case digit(Int)
    case dot
    case op(Op)
}
extension CalculatorButtonItem : Hashable{
    var title: String{
        switch self{
        case .digit(let value):return String(value)
        case .dot: return "."
        case .op(let op): return op.rawValue
        }
    }
}


enum OpCu: String{
    case plus = "+"
    case minus = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
    case clean = "AC"
}
