//
//  ViewController.swift
//  Krutarth_Rathod_Orange_Calculator
//
//  Created by Krutarthkumar Rathod on 2019-09-11.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARk:- other variables
    var calculatorModel = Krutarth_Calculator_Model()
    
    //Mark:- Outlets
    @IBOutlet weak var numberDisplay: UITextField!
    var startNewnumber = true
    //Mark:- Actions
    @IBAction func buttonTouched(_ sender: UIButton) {
        print("Button Touched")
        print(sender.currentTitle!)
     
        
        let buttonText = sender.currentTitle!
        
        var currentValue = numberDisplay.text!
        
        switch (buttonText) {
        case "0","1","2","3","4","5","6","7","8","9",".":
            print(buttonText)
            if (startNewnumber){
                if(buttonText == "."){
                    currentValue = "0."
                } else {
                    currentValue = buttonText
                }
            } else{
                
            if(buttonText == ".") {
                if(currentValue.contains(".")){
                    //do nothing
                } else {
                    currentValue = currentValue + buttonText
                }
            } else {
                currentValue = currentValue + buttonText
                }
                
            }
            
            startNewnumber = false
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
        //do something
            
        case "+", "-", "X", "/":
            if(calculatorModel.secondNumber != nil)
            {
                currentValue = String(calculatorModel.getresult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            calculatorModel.operation = buttonText
            startNewnumber = true
            //accept second number after this
            
        case "=":
            //get the result and display it
            if (calculatorModel.secondNumber == nil){
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            }
            currentValue = String(calculatorModel.getresult())
            startNewnumber = true
            
        case "C":
            currentValue = "0"
            calculatorModel.reset()
            startNewnumber = true
            
        default:
            //do something by default
            print(buttonText)
        }
    numberDisplay.text = currentValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

