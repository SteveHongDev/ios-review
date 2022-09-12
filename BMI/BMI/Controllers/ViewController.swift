//
//  ViewController.swift
//  BMI
//
//  Created by 홍성범 on 2022/09/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculateManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        makeUI()
    }
    
    private func makeUI() {
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        
        heightTextField.placeholder = "cm 단위로 입력"
        weightTextField.placeholder = "kg 단위로 입력"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "키와 몸무게를 입력하세요!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(ok)
            present(alert, animated: true)
            
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let VC = segue.destination as! SecondViewController
            
            VC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
            
            heightTextField.text = ""
            weightTextField.text = ""
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        return false
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "" && weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        
        return false
    }
}
