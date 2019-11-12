//
//  Krutarth_Calculator_Model.swift
//  Krutarth_Rathod_Orange_Calculator
//
//  Created by Krutarthkumar Rathod on 2019-09-11.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import Foundation

class Krutarth_Calculator_Model{
    
    var firstNumber: Double?
    var secondNumber: Double?
    var operation: String?
    
    
    func updateNumber(newNumber: Double){
        if(firstNumber == nil){
            firstNumber = newNumber
        } else if (operation == nil){
            firstNumber = newNumber
        } else {
            secondNumber = newNumber
        }
    }
    
    func getresult() -> Double {
        var result: Double
        switch (operation) {
        case "+":
            result = firstNumber! + secondNumber!
        case "-":
            result = firstNumber! - secondNumber!
        case "X":
            result = firstNumber! * secondNumber!
        case "/":
            result = firstNumber! / secondNumber!
        default:
            result = 0.0
        }
        return result
    }
    
    func reset(){
        firstNumber = nil
        operation = nil
        secondNumber = nil
    }
}
