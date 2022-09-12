//
//  BMICalculateManager.swift
//  BMI
//
//  Created by 홍성범 on 2022/09/12.
//

import Foundation
import UIKit

class BMICalculateManager {
    
    private var bmi: BMI?
    
    func getBMI(height: String, weight: String) -> BMI {
        
        calculateBMI(height: height, weight: weight)
        
        return bmi ?? BMI(value: 0.0, matchColor: .black, description: "오류")
    }
    
    func calculateBMI(height: String, weight: String) {
        guard let h = Float(height), let w = Float(weight) else {
            bmi = BMI(value: 0.0, matchColor: .black, description: "오류")
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10
        
        switch bmiNumber {
        case ..<18.5:
            bmi = BMI(value: bmiNumber, matchColor: .blue, description: "저체중")
        case 18.5..<22.9:
            bmi = BMI(value: bmiNumber, matchColor: .green, description: "표준")
        case 22.9..<24.9:
            bmi = BMI(value: bmiNumber, matchColor: .yellow, description: "과체중")
        case 24.9..<29.9:
            bmi = BMI(value: bmiNumber, matchColor: .orange, description: "중도 비만")
        case 29.9...:
            bmi = BMI(value: bmiNumber, matchColor: .red, description: "고도 비만")
        default:
            bmi = BMI(value: 0.0, matchColor: .black, description: "오류")
        }
    }
}
