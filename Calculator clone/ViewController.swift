//
//  ViewController.swift
//  Calculator clone
//
//  Created by Iuliana Stecalovici  on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var NumbersButtons: [UIButton]!
    
    @IBOutlet weak var numberOnScreen: UILabel!
    
    var opeRator = ""
    var firstNumber = "0"
    var secondNumber = ""
    var twoMinus = false
    
    private func updateLabel(){
        if secondNumber == "" {
                    numberOnScreen.text = firstNumber
            } else {
            numberOnScreen.text = secondNumber
        }
    }
    
    @IBAction func CancelButton(_ sender: UIButton) {
         opeRator = ""
         firstNumber = "0"
         secondNumber = ""
         updateLabel()
    }
    
    @IBAction func pressOperator(_ sender: UIButton) {
        
        if opeRator == ""{
            opeRator = (sender.titleLabel?.text)!
            updateLabel()
        } else {
            opeRator = (sender.titleLabel?.text)!
            updateLabel()
            
            if secondNumber != "" {
                switch(opeRator){
                case "÷":
                    firstNumber = String(Int(firstNumber)! / Int(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "×":
                    firstNumber = String(Int(firstNumber)! * Int(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "-":
                    firstNumber = String(Int(firstNumber)! - Int(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "+":
                    firstNumber = String(Int(firstNumber)! + Int(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                default:break
                }
            }
        }
    }
    
    @IBAction func minusSign(_ sender: UIButton) {
        
        if numberOnScreen.text?.first == "-"{
                    twoMinus = !twoMinus
                }
                
        if firstNumber == "0" {
                if twoMinus == false {
                            firstNumber = "-0"
                            updateLabel()
                       
                    }
                } else {
                if secondNumber == ""{
                    firstNumber = "-" + firstNumber
                    updateLabel()
                } else{
                    secondNumber = "-" + secondNumber
                    updateLabel()
                }
           // }
    
            if twoMinus == true{
                if secondNumber == ""{
                    if firstNumber == "-0"{
                        firstNumber.removeFirst(1)
                        updateLabel()
                        twoMinus = false
                    }else{
                        firstNumber.removeFirst(2)
                        updateLabel()
                        twoMinus = false
                    }
                } else{
                    secondNumber.removeFirst(2)
                    updateLabel()
                    twoMinus = false
                }
            }
        }
       
    }
    
    
    @IBAction func pointNumber(_ sender: UIButton) {
        if opeRator == ""{
            if firstNumber == "0"{
                firstNumber = String(firstNumber) + "."
                updateLabel()
            }
            else{
                if firstNumber == "-0"{
                    firstNumber = "-"
                    firstNumber = String(firstNumber) +  "."
                    updateLabel()
                } else{
                    firstNumber = String(firstNumber) +  "."
                    updateLabel()
                }
            }
        } else{
            secondNumber = String(secondNumber) +  "."
            updateLabel()
        }
    }
    
    
    @IBAction func equalLogic(_ sender: UIButton) {
        if opeRator != "" {
            if secondNumber != "" {
                switch(opeRator){
                case "÷":
                    firstNumber = String(Float(firstNumber)! / Float(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "×":
                    firstNumber = String(Float(firstNumber)! * Float(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "-":
                    firstNumber = String(Float(firstNumber)! - Float(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                case "+":
                    firstNumber = String(Float(firstNumber)! + Float(secondNumber)!)
                    secondNumber = ""
                    updateLabel()
                default:break
                }
            }
        }
    }
    
    @IBAction func pressANumber(_ sender: Any) {
        if opeRator == ""{
            if firstNumber == "0"{
                firstNumber = ""
                firstNumber = String(firstNumber) + String((sender as! UIButton).tag)
                updateLabel()
            }
            else{
                if firstNumber == "-0"{
                    firstNumber = "-"
                    firstNumber = String(firstNumber) + String((sender as! UIButton).tag)
                    updateLabel()
                } else{
                    firstNumber = String(firstNumber) + String((sender as! UIButton).tag)
                    updateLabel()
                }
            }
        } else{
            secondNumber = String(secondNumber) + String((sender as! UIButton).tag)
            updateLabel()
        }
    }
}

