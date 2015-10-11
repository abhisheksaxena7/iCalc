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
    @IBOutlet weak var display: UILabel!
    
    var userIsInTHeMiddleOfTyping = false

    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
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
    
    var operandStack = Array<Double>()
    
    @IBAction func enter()
    {
        userIsInTHeMiddleOfTyping = false
        operandStack.append(displayValue)
        print("OperandStack = \(operandStack)")
    }
   
    var displayValue: Double {
        get
        {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set
        {
            display.text = "\(newValue)"
            userIsInTHeMiddleOfTyping = false;
        }
    }

}

