//
//  RPS.swift
//  rps-game
//
//  Created by 홍성범 on 2022/09/06.
//

import Foundation
import UIKit

// 랜덤값 편하게 생성하기 위해 Int 형 rawValue 정의
enum RPS: Int {
    case ready
    case rock
    case paper
    case scissors
    
    var rpsInfo: (image: UIImage, name: String) {
        switch self {
        case .ready:
            return (#imageLiteral(resourceName: "ready"), "준비")
        case .rock:
            return (#imageLiteral(resourceName: "rock"), "바위")
        case .paper:
            return (#imageLiteral(resourceName: "paper"), "보")
        case .scissors:
            return (#imageLiteral(resourceName: "scissors"), "가위")
        }
    }
}
