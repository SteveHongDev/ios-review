//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 홍성범 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        titleLabel.text = "반갑습니다"
        
        myButton.backgroundColor = .red
        myButton.setTitleColor(.blue, for: .normal)
        
//        titleLabel.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.8901960784, blue: 1, alpha: 1)
    }
    

}

