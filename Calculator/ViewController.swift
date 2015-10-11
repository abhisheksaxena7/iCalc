//
//  ViewController.swift
//  Calculator
//
//  Created by Abhishek Saxena on 10/9/15.
//  Copyright © 2015 Abhishek Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!    //The main label where all stuff is going to appear
    
    var userIsInTHeMiddleOfTyping = false   //For multiple digit numbers insertion

    @IBAction func appendDigit(sender: UIButton)    //Handling insertion of numbers
    {
        let digit = sender.currentTitle!    //Gain information about the sender button
        if userIsInTHeMiddleOfTyping
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            userIsInTHeMiddleOfTyping = true
        }
        
        print("digit = \(digit)")
        
    }
    
    @IBAction func operate(sender: UIButton)    //Handling operators and calculations
    {
        let operation = sender.currentTitle!
        if userIsInTHeMiddleOfTyping    //If enter hasn't been pressed after typing a number and before pressing an operator. Implicitly call it to push the current display value onto the stack.
        {
            enter()
        }
        switch operation
        {
        case "✕" : performOperation { $0 * $1 } //Closures
        case "÷" : performOperation { $1 / $0 }
        case "+" : performOperation { $0 + $1 }
        case "−" : performOperation { $1 - $0 }
        case "√" : performOperation { sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double,Double) ->Double)      //receives a closure function as an argument called operation
    {
        if operandStack.count>=2
        {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())      //calls operation function
            enter()
        }
    }
    
    @nonobjc    //since objective c doesn't support method overloading and swift does. Inheriting from UIViewController makes Obj-C compiler to bug this code. So adding this attribute it lets it pass.
    func performOperation(operation: Double -> Double)
    {
        if operandStack.count>=1
        {
            displayValue = operation(operandStack.removeLast())      //calls operation function
            enter()
        }
    }
    
    var operandStack = Array<Double>()  //Stack to store all the operands
    
    @IBAction func enter()  //Handling events when enter key is pressed
    {
        userIsInTHeMiddleOfTyping = false
        operandStack.append(displayValue)
        print("OperandStack = \(operandStack)")
    }
   
    var displayValue: Double {  //Computed Property converting string to double and vice versa for insertion in stack
        get
        {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set
        {
            print("I'm here")
            display.text = "\(newValue)"
            userIsInTHeMiddleOfTyping = false;
        }
    }

    
}

