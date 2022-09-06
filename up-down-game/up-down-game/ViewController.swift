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
    
    // 컴퓨터가 랜덤숫자를 선택
    private var cpuNumber = Int.random(in: 1...10)
    private var myNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) nameLabel에 "선택하세요"
        nameLabel.text = "선택하세요"
        // 2) numberLabel에 ""
        numberLabel.text = ""
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        // 숫자를 가져옴, 레이블을 변경
        if let input = sender.currentTitle, let number = Int(input) {
            numberLabel.text = input
            myNumber = number
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤숫자를 재선택
        cpuNumber = Int.random(in: 1...10)
        // 2) nameLabel에 "선택하세요"
        nameLabel.text = "선택하세요"
        // 3) numberLabel에 ""
        numberLabel.text = ""
    }
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 숫자 서로 비교 후 UP, DOWN, BINGO nameLabel에 표시
        if myNumber > cpuNumber {
            nameLabel.text = "DOWN"
        } else if myNumber < cpuNumber {
            nameLabel.text = "UP"
        } else {
            nameLabel.text = "BINGO😼"
        }
    }
}

