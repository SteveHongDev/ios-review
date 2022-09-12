//
//  RPSManager.swift
//  rps-game
//
//  Created by 홍성범 on 2022/09/12.
//

import UIKit

struct RPSManager {
    private var cpuChoice = RPS(rawValue: Int.random(in: 1...3))!
    private var myChoice = RPS(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> RPS {
        return .ready
    }
    
    func getUserRPS() -> RPS {
        return myChoice
    }
    
    func getComputerRPS() -> RPS {
        return cpuChoice
    }
    
    mutating func resetComputerChoice() {
        cpuChoice = RPS(rawValue: Int.random(in: 1...3))!
        myChoice = RPS(rawValue: Int.random(in: 1...3))!
    }
    
    mutating func userGetSelected(name: String) {
        
        switch name {
        case "가위":
            myChoice = RPS.scissors
        case "바위":
            myChoice = RPS.rock
        case "보":
            myChoice = RPS.paper
        default:
            myChoice = RPS.rock
        }
    }
    
    func getRPSResult() -> String {
        if cpuChoice == myChoice {
            return "비겼다"
        } else if cpuChoice == .rock && myChoice == .paper {
            return "이겼다"
        } else if cpuChoice == .paper && myChoice == .scissors {
            return "이겼다"
        } else if cpuChoice == .scissors && myChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
}
