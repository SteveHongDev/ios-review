//
//  ViewController.swift
//  up-down-game
//
//  Created by 홍성범 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var upDownManager = UpDownManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    func reset() {
        nameLabel.text = "선택하세요"
        numberLabel.text = ""
        upDownManager.resetNum()
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        // 숫자를 가져옴, 레이블을 변경
        if let input = sender.currentTitle, let number = Int(input) {
            numberLabel.text = input
            upDownManager.setMyNum(number: number)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 숫자 서로 비교 후 UP, DOWN, BINGO nameLabel에 표시
        
        nameLabel.text = upDownManager.getResult()
    }
}

