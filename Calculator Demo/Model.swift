//
//  Model.swift
//  Calculator Demo
//
//  Created by djing on 2020/8/5.
//  Copyright © 2020 djing. All rights reserved.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp(
        left: String,
        op: CalculatorButtonItem.Op
    )
    case leftOpRight(
        left: String,
        op: CalculatorButtonItem.Op,
        right: String
    )
    case error
    
    var output: String{
        let result: String
        switch self {
        case .left(let left): result = left
        case .leftOp(let left, _): result = left
        case .leftOpRight(_, _, let right): result = right
        case .error: return "Error"
        }
        guard let value = Double(result) else{
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    
    
    

    
    
    
    
}


var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 9
    f.numberStyle = .decimal
    return f
}()

extension CalculatorButtonItem.Op{
    func calculate(l: String, r: String) -> String? {
        guard let left = Double(l), let right = Double(r) else{
            return nil
        }
        let result: Double?
        switch self{
        case .plus: result = left + right
        case .minus: result = left - right
        case .multiply: result = left * right
        case .divide: result = right == 0 ? nil : left / right
        case .equal: fatalError()
        }
        return result.map{ String($0) }
    }
    
}
