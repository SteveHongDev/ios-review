//
//  main.swift
//  random-bingo
//
//  Created by 홍성범 on 2022/09/06.
//

import Foundation

var correct = false
let randomNumber = Int.random(in: 1...100)

while !correct {
    let myNumber = readLine()
    
    if let input = myNumber, let number = Int(input) {
        
        if randomNumber > number {
            print("UP")
        } else if randomNumber < number {
            print("DOWN")
        } else {
            print("BINGO")
            correct = !correct
        }
    }
}
