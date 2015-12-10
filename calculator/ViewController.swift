//
//  ViewController.swift
//  calculator
//
//  Created by Andy on 09/12/2015.
//  Copyright © 2015 niveusrosea. All rights reserved.
//

import Cocoa

let stringValueDefault = "0.0"

class ViewController: NSViewController
{
    
    @IBOutlet var outputLabel: NSTextField!

    typealias op_t = (Double, Double) -> Double
    
    var lhs: Double = 0.0
    var rhs: Double = 0.0
    var op: op_t?
    
    @IBAction func clearClick(button: NSButton)
    {
        lhs = 0.0
        op = nil
        rhs = 0.0
        outputLabel.stringValue = stringValueDefault
    }
    
    @IBAction func additionClick(button: NSButton)
    {
        // TODO: Implement Me
    }
    
    @IBAction func subtractionClick(button: NSButton)
    {
        //Rubbish comment PRB
        registerOperation{ lhs, rhs in
            return lhs - rhs
        }
    }
    
    @IBAction func multiplicationClick(button: NSButton)
    {
        // TODO: Implement Me
    }
    
    @IBAction func divisionClick(button: NSButton)
    {
        // TODO: Implement Me
    }
    
    @IBAction func resultClick(button: NSButton)
    {
        perform()
        op = nil
    }
    
    func perform()
    {
        guard let op = op where rhs > 0 else
        {
            return
        }
        lhs = op(lhs, rhs)
        outputLabel.stringValue = String(lhs)
    }
    
    func registerOperation(op: op_t)
    {
        perform()
        if let rhs = Double(outputLabel.stringValue) where rhs != 0
        {
            lhs = rhs
            self.rhs = 0.0
        }
        self.op = op
    }
    
    @IBAction func numberClick(button: NSButton)
    {
        outputLabel.stringValue = rhs == 0 ? button.title : outputLabel.stringValue + button.title
        rhs = Double(outputLabel.stringValue)!
    }

}

