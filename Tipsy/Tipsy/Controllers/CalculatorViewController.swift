//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedPct: Double = 0.1
    var stepperValue: Int = 2
    var totalPerPerson: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        let button = sender.currentTitle
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if button == "0%" {
            zeroPctButton.isSelected = true
            selectedPct = 0.0
        } else if button == "10%" {
            tenPctButton.isSelected = true
            selectedPct = 0.1
        } else {
            twentyPctButton.isSelected = true
            selectedPct = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        stepperValue = Int(sender.value)
        splitNumberLabel.text = String("\(stepperValue)")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if let check = Double(billTextField.text!) {
            
            let checkTip = selectedPct * check
            
            let total = check + checkTip
            totalPerPerson = Double(round(1000*(total / Double(stepperValue)))/1000)
            print("Total \(totalPerPerson)")
            self.performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(format: "%.2f", totalPerPerson)
            destinationVC.people = String(stepperValue)
            destinationVC.tipPercentage = String(format: "%.2f", selectedPct)
        }
    }
}

