//
//  ViewController.swift
//  Calculator
//
//  Created by Paul Mo on 2023/10/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var isTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.titleLabel!.text!
        if isTyping {
            let currentDigit = display.text!
            display.text = currentDigit + digit
        } else {
            display.text = digit
        }
        isTyping = true
        
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorModel()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if isTyping {
            calculator.setOperand(operand: displayValue)
            isTyping = false
        }
        if let mathSymbol = sender.titleLabel?.text {
            calculator.performOperation(symbol: mathSymbol)
        }
        displayValue = calculator.result
    }
    
}

