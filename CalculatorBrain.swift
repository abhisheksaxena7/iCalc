//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Abhishek Saxena on 10/25/15.
//  Copyright © 2015 Abhishek Saxena. All rights reserved.
//

//Model class of our Calculator. Notice how we're not importing the UI KIT, since model is UI independent thus no need to import it.
import Foundation

class CalculatorBrain
{
    enum Op
    {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double,Double) -> Double)
    }
    
    var opStack = [Op]()       //var opStack: Array<Op>{}
    
    var knownOps = [String:Op]()
    
    init()
    {
        knownOps["×"] = Op.BinaryOperation("×") { $0 * $1 }
        knownOps["+"] = Op.BinaryOperation("+") { $0 + $1 }
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["√"] = Op.UnaryOperation("√") { sqrt($0) }
    }
    
    func pushOperand(operand: Double)
    {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String)
    {
        
    }
}