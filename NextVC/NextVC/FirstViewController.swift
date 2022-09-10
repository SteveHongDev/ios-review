//
//  FirstViewController.swift
//  NextVC
//
//  Created by 홍성범 on 2022/09/10.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let lbl = UILabel()
        
        
        lbl.font = .systemFont(ofSize: 22)
        
        return lbl
    }()
    let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        
        view.backgroundColor = .gray
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        mainLabel.text = someString
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    

}
