//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Juan Ramírez Blancas on 04/05/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?

    
    mutating func calculateBMI(height: Float, weight: Float) {
      let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            print("underweight")
            bmi = BMI(value: bmiValue, advice: "Eat More pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            print("Normal weight")
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            print("Overweight")
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1))
        }
//        bmi = BMI(value: bmiValue, advice: "Hi", color: .red)
         
    }
    
    func getBMIValue() -> String {
        let bmitTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmitTo1Decimal
    }
    
    func getColor() -> UIColor {
        return bmi?.color  ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func getAdvice() -> String{
        return bmi?.advice  ?? "No advice"
    }
}
