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
    var firstNumber = ""
    var secondNumber = ""
    var twoMinus = false
    var minusNumber = false
    
    private func updateLabel(){
        if secondNumber == "" {
            if firstNumber == ""{
                numberOnScreen.text = "0"
            } else {
                numberOnScreen.text = firstNumber
            }
        } else {
            numberOnScreen.text = secondNumber
        }
    }
    
//    if secondNumber == "" {
//        if firstNumber == ""{
//            numberOnScreen.text = "0"
//        } else {
//            if minusNumber == true {
//                numberOnScreen.text = "-" + firstNumber
//                minusNumber = false
//            } else{
//                numberOnScreen.text = firstNumber
//            }
//        }
//    } else {
//        if minusNumber == true {
//            numberOnScreen.text = "-" + secondNumber
//            minusNumber = false
//        } else {
//            numberOnScreen.text = secondNumber
//        }
//    }
    
    @IBAction func CancelButton(_ sender: UIButton) {
         opeRator = ""
         firstNumber = ""
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
                    numberOnScreen.text = String(Int(firstNumber)! / Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! / Int(secondNumber)!)
                    secondNumber = ""
                case "×":
                    numberOnScreen.text = String(Int(firstNumber)! * Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! * Int(secondNumber)!)
                    secondNumber = ""
                case "-":
                    numberOnScreen.text = String(Int(firstNumber)! - Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! - Int(secondNumber)!)
                    secondNumber = ""
                case "+":
                    numberOnScreen.text = String(Int(firstNumber)! + Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! + Int(secondNumber)!)
                    secondNumber = ""
                default:break
                }
            }
        }
    }
    
    func isThereAMinus(){
        if numberOnScreen.text?.first == "-"{
            twoMinus = !twoMinus
        }
    }
    
    @IBAction func minusSign(_ sender: UIButton) {
        
        
        
        minusNumber = !minusNumber
        print(minusNumber)
        isThereAMinus()
        
        if numberOnScreen.text == "0" {
                    if twoMinus == false {
                        if minusNumber == true{
                            firstNumber = "-0"
                            updateLabel()
                        }
                    }
                } else {
            if minusNumber == true{
                print("n")
                if secondNumber == ""{
                    firstNumber = "-" + firstNumber
                    updateLabel()
                    minusNumber = !minusNumber
                    print("l")
                } else{
                    secondNumber = "-" + secondNumber
                    updateLabel()
                    minusNumber = !minusNumber
                }
            }
            
            print(twoMinus)
            
            if twoMinus == true{
                if secondNumber == ""{
                    firstNumber.removeFirst(2)
                    updateLabel()
                    print("A")
                    twoMinus = false
                    
                } else{
                    secondNumber.removeFirst(2)
                    updateLabel()
                    print("c")
                    twoMinus = false
                }
            }
        }
       
    }
    
    @IBAction func equalLogic(_ sender: UIButton) {
        if opeRator != "" {
            if secondNumber != "" {
                switch(opeRator){
                case "÷":
                    numberOnScreen.text = String(Int(firstNumber)! / Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! / Int(secondNumber)!)
                    secondNumber = ""
                case "×":
                    numberOnScreen.text = String(Int(firstNumber)! * Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! * Int(secondNumber)!)
                    secondNumber = ""
                case "-":
                    numberOnScreen.text = String(Int(firstNumber)! - Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! - Int(secondNumber)!)
                    secondNumber = ""
                case "+":
                    numberOnScreen.text = String(Int(firstNumber)! + Int(secondNumber)!)
                    firstNumber = String(Int(firstNumber)! + Int(secondNumber)!)
                    secondNumber = ""
                default:break
                }
            }
        }
    }
    
    @IBAction func pressANumber(_ sender: Any) {
        
        if opeRator == ""{
            firstNumber = String(firstNumber) + String((sender as! UIButton).tag)
            updateLabel()
        } else{
            secondNumber = String(secondNumber) + String((sender as! UIButton).tag)
            updateLabel()
        }
        //print(firstNumber)
    }
}

