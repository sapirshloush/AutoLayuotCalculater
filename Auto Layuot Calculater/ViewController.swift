//
//  ViewController.swift
//  Auto Layuot Calculater
//
//  Created by sapir on 05/01/2019.
//  Copyright © 2019 Sapir Shloush. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        }
        else {
            
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 { //Divide
                label.text = "/"
            }
            
            if sender.tag == 13 { //Multiply
                label.text = "x"
            }
            
            if sender.tag == 14 { //Subtract
                label.text = "-"
            }
            
            if sender.tag == 15 { //Add
                label.text = "+"
            }
            if sender.tag == 17 { // Percentage
                label.text = "%"
            }
            if sender.tag == 18 {
                label.text = "-\(numberOnScreen)"
            }
            
            operation = sender.tag
            performingMath = true;
            
        }
            
        else if sender.tag == 16 {
            
            if operation == 12{ //Divide
                
                label.text = String(previousNumber / numberOnScreen)
            }
                
            else if operation == 13{ //Multiply
                
                label.text = String(previousNumber * numberOnScreen)
            }
                
            else if operation == 14{ //Subtract
                
                label.text = String(previousNumber - numberOnScreen)
            }
                
            else if operation == 15{ //Add
                
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 17 { // Percentage
                label.text = String(numberOnScreen / 100)
                
            }
            else if operation == 18 { // +/-
                
                label.text = String(numberOnScreen - (numberOnScreen*2))
            }
            
        }
            
        else if sender.tag == 11{
            
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            
        }
        
    }
    

    
}
