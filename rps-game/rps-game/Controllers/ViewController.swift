//
//  ViewController.swift
//  rps-game
//
//  Created by 홍성범 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cpuImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var cpuChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var rpsManager = RPSManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 1, 2 번째 이미지에 준비(묵) 이미지 띄우기
        cpuImageView.image = rpsManager.getReady().rpsInfo.image
        myImageView.image = rpsManager.getReady().rpsInfo.image
        
        // 2) 1, 2 번째 레이블에 "준비" 문자 띄우기
        cpuChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
    }

    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위, 바위, 보 선택한 정보를 저장
        rpsManager.userGetSelected(name: sender.currentTitle!)
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        cpuImageView.image = rpsManager.getComputerRPS().rpsInfo.image
        cpuChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name
        
        myImageView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.name
        
        // 그 정보를 이용하여 컴퓨터와 나 둘 중에 누가 이겼는지 판단
        mainLabel.text = rpsManager.getRPSResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 다시 준비 상태로 초기화
        
        // 1) 1, 2 번째 이미지에 준비(묵) 이미지 띄우기
        cpuImageView.image = rpsManager.getReady().rpsInfo.image
        myImageView.image = rpsManager.getReady().rpsInfo.image
        
        // 2) 1, 2 번째 레이블에 "준비" 문자 띄우기
        cpuChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        // 3) 메인 레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 4) 컴퓨터가 가위, 바위, 보를 다시 선택하도록 함
        rpsManager.resetComputerChoice()
    }
}


