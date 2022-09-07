//
//  ViewController.swift
//  first-new-app
//
//  Created by 홍성범 on 2022/09/07.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    
    weak var timer: Timer?
    
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel.text = "초를 선택하세요"
        timerSlider.setValue(0.5, animated: true)
        timer?.invalidate()
    }
    
    @IBAction func timerSliderChanged(_ sender: UISlider) {
        seconds = Int(sender.value * 60)
        titleLabel.text = "\(seconds)초"
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setupUI()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(repeatEverySecond), userInfo: nil, repeats: true)
        
//        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//            
//        }
    }
    
    @objc func repeatEverySecond() {
        if seconds > 0 {
            seconds -= 1
            timerSlider.value = Float(seconds) / 60
            titleLabel.text = "\(seconds)초"
        } else {
            timer?.invalidate()
            
            // 종료 사운드
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
}
