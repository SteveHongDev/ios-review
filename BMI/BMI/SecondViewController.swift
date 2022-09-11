//
//  SecondViewController.swift
//  BMI
//
//  Created by 홍성범 on 2022/09/11.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var bmiNumber: Float?
    var descriptionString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        recalculateButton.layer.cornerRadius = 5
        recalculateButton.clipsToBounds = true
        bmiLabel.layer.cornerRadius = 10
        bmiLabel.clipsToBounds = true
        bmiLabel.backgroundColor = .gray
        
        guard let bmi = bmiNumber else { return }
        bmiLabel.text = String(bmi)
        descriptionLabel.text = descriptionString
        bmiLabel.backgroundColor = bmiColor
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
