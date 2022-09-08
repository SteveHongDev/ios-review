//
//  ViewController.swift
//  textfield-project
//
//  Created by 홍성범 on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = .gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        // 먼저 반응해야 하는 녀석으로 만들어준 것
        textField.becomeFirstResponder()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }

}

extension ViewController: UITextFieldDelegate {
    
    // TextField 입력 시작시 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // TextField 입력 시작 시점에 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    // should: 허락
    // clear 시에 clear 해도 되는지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true // 지워진다.
    }
    
    // TextField 내용 한글자 한글자가 입력/삭제될 때 호출 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 10글자로 제한
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
    
    // enter 키 누른 후 다음 동작을 허락할 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.endEditing(true)
        return true
    }
    
    // 화면 탭 감지
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // textField.resignFirstResponder() 와 행동이 같다.
    }
    
    // 입력 끝을 허락할지
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 입력이 끝나면 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.text = ""
    }
}
