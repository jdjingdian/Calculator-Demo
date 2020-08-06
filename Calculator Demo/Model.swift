//
//  Model.swift
//  Calculator Demo
//
//  Created by djing on 2020/8/5.
//  Copyright © 2020 djing. All rights reserved.
//

import Foundation

class CalculatorViewModel : ObservableObject {
    @Published var display = "0"
    @Published var typInMiddle = false
}
