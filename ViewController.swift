//
//  ViewController.swift
//  Calc
//
//  Created by wang on 26/04/2019.
//  Copyright © 2019 Wangdelz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numberOnScreen: Double = 0;
    
    var previousNumber: Double = 0;
    
    var percentNumber: Double = 0;
    
    var performingMath = false;
    
    var operation = 0;
    
    var calc = 0;
    
    var percentage : Double = 100;
    
    override func viewDidLoad() {
        super.viewDidLoad()
         resultCalc.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateResult(_ sender: UIButton) {

        if performingMath == true {
            
            resultCalc.text = String(sender.tag-1)
            
            numberOnScreen = Double(resultCalc.text!)!
            
            performingMath = false
            
        }
            
        else {
            
            resultCalc.text = resultCalc.text! + String(sender.tag-1)
            
            numberOnScreen = Double(resultCalc.text!)!
            
        }
    
    }
    
    @IBOutlet weak var resultCalc: UILabel!
    
    @IBAction func calcTotal(_ sender: UIButton) {
        
        if resultCalc.text != "" &&
            sender.tag != 11 &&
            sender.tag != 16 {
            
            if resultCalc.text == "/" ||
                resultCalc.text == "x" ||
                resultCalc.text == "-"  ||
                resultCalc.text == "+" { //Add
                
                if resultCalc.text == "/" { //Divide
                    
                    resultCalc.text = "/";
                    
                }
                
                if resultCalc.text == "x" { //Multiply
                    
                    resultCalc.text = "x";
                    
                }
                
                if resultCalc.text == "-" { //Subtract
                    
                    resultCalc.text = "-";
                    
                }
                
                if resultCalc.text == "+" { //Add
                    
                    resultCalc.text = "+";
                    
                }
                
            } else {
                
                previousNumber = Double(resultCalc.text!)!
            
                if sender.tag == 17 {
                    if (previousNumber >= 0) {
                       resultCalc.text = "-\(previousNumber)"
                    } else {
                        resultCalc.text = String(0 - previousNumber)
                    }
                    
                } else if sender.tag == 18 {
                    
                    resultCalc.text = String(previousNumber / 100)
                    
                } else {
                
                
                    if sender.tag == 12 { //Divide
                        
                        resultCalc.text = "/";
                        
                    }
                    
                    if sender.tag == 13 { //Multiply
                        
                        resultCalc.text = "x";
                        
                    }
                    
                    if sender.tag == 14 { //Subtract
                        
                        resultCalc.text = "-";
                        
                    }
                    
                    if sender.tag == 15 { //Add
                        
                        resultCalc.text = "+";
                        
                    }
                    
                }
            }
                operation = sender.tag
                
                performingMath = true;
            
            
        }
            
        else if sender.tag == 16 {
            
            if operation == 12 { //Divide
                
                resultCalc.text = String(previousNumber / numberOnScreen)
                
            }
                
            else if operation == 13 { //Multiply
                
                resultCalc.text = String(previousNumber * numberOnScreen)
                
            }
                
            else if operation == 14 { //Subtract
                
                resultCalc.text = String(previousNumber - numberOnScreen)
                
            }
                
            else if operation == 15 { //Add
                
                resultCalc.text = String(previousNumber + numberOnScreen)
                
            }
            
        }
            
        else if sender.tag == 11 {
            
            resultCalc.text = ""
            
            previousNumber = 0;
            
            numberOnScreen = 0;
            
            operation = 0;
            
        }
            
        else if sender.tag == 17 {
            
            resultCalc.text = ""
            
        }
        
    }
    
    @IBAction func pressDot(_ sender: Any) {
        
        if (resultCalc.text!.isEmpty){
            resultCalc.text = "0."
        }
        else{
            if resultCalc.text!.range(of:".") == nil{
                resultCalc.text = resultCalc.text! + "."
            }
        }
    }
    
}

