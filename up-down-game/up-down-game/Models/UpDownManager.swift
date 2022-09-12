//
//  UpDownManager.swift
//  up-down-game
//
//  Created by 홍성범 on 2022/09/12.
//

import Foundation

struct UpDownManager {
    // 컴퓨터가 랜덤숫자를 선택
    private var cpuNumber = Int.random(in: 1...10)
    private var myNumber = 1
    
    mutating func resetNum() {
        cpuNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    mutating func setMyNum(number: Int) {
        myNumber = number
    }
    
    func getResult() -> String {
        
        if myNumber > cpuNumber {
            return "DOWN"
        } else if myNumber < cpuNumber {
            return "UP"
        } else {
            return "BINGO😼"
        }
    }
}
