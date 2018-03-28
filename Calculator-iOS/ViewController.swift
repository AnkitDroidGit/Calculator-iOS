//
//  ViewController.swift
//  Calculator-iOS
//
//  Created by Ankit Kumar on 22/03/2018.
//  Copyright © 2018 Ankit Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLbl: UILabel!
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLbl.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func grayBtnPressed(_ sender: Any) {
    }
    
    @IBAction func orangeBtnPressed(_ sender: Any) {
    }
    @IBAction func btnPressed(_ sender: Any) {
        if canClear {
            resultLbl.text = ""
            canClear = false
        }
        let currentText = resultLbl.text!
        let textLabel = (sender as AnyObject).titleLabel??.text
        if let text = textLabel {
            switch text {
            case "+", "*", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLbl.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultLbl.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLbl.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}

