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
    
    private var cpuChoice = RPS.rock
    private var myChoice = RPS.rock
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 1, 2 번째 이미지에 준비(묵) 이미지 띄우기
        cpuImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 2) 1, 2 번째 레이블에 "준비" 문자 띄우기
        cpuChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
        // CPU Random
        cpuChoice = RPS(rawValue: Int.random(in: 0...2))!
        
    }

    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위, 바위, 보 선택한 정보를 저장
        
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myChoice = RPS.scissors
        case "바위":
            myChoice = RPS.rock
        case "보":
            myChoice = RPS.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 랜덤 선택 정보를 이미지뷰에 표시
        // 2) 레이블에 표시
        switch cpuChoice {
        case .rock:
            cpuImageView.image = #imageLiteral(resourceName: "rock")
            cpuChoiceLabel.text = "바위"
        case .paper:
            cpuImageView.image = #imageLiteral(resourceName: "paper")
            cpuChoiceLabel.text = "보"
        case .scissors:
            cpuImageView.image = #imageLiteral(resourceName: "scissors")
            cpuChoiceLabel.text = "가위"
        }
    
        // 3) 나의 선택 정보를 이미지뷰에 표시
        // 4) 레이블에 표시
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 그 정보를 이용하여 컴퓨터와 나 둘 중에 누가 이겼는지 판단
        switch myChoice {
        case .rock:
            switch cpuChoice {
            case .rock:
                mainLabel.text = "비겼습니다!"
            case .paper:
                mainLabel.text = "졌습니다!"
            case .scissors:
                mainLabel.text = "이겼습니다!"
            }
        case .paper:
            switch cpuChoice {
            case .rock:
                mainLabel.text = "이겼습니다!"
            case .paper:
                mainLabel.text = "비겼습니다!"
            case .scissors:
                mainLabel.text = "졌습니다!"
            }
        case .scissors:
            switch cpuChoice {
            case .rock:
                mainLabel.text = "졌습니다!"
            case .paper:
                mainLabel.text = "이겼습니다!"
            case .scissors:
                mainLabel.text = "비겼습니다!"
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 다시 준비 상태로 초기화
        
        // 1) 1, 2 번째 이미지에 준비(묵) 이미지 띄우기
        cpuImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 2) 1, 2 번째 레이블에 "준비" 문자 띄우기
        cpuChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
        // 3) 메인 레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 4) 컴퓨터가 가위, 바위, 보를 다시 선택하도록 함
        cpuChoice = RPS(rawValue: Int.random(in: 0...2))!
    }
}


