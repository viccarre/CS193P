//
//  ViewController.swift
//  Calculator Assignment 1
//
//  Created by Victor Carreño on 4/30/16.
//  Copyright © 2016 Victor Carreño. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var display: UILabel!
    var userIsInMiddleOfTyping = false

    @IBAction private func touchDigit(sender: UIButton) {

        let digit = sender.currentTitle!
        if userIsInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInMiddleOfTyping = true
    }

    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()

    @IBAction private func performOperation(sender: UIButton) {
        if userIsInMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperand(mathematicalSymbol)
        }

        displayValue = brain.result
    }
}

