//
//  ViewController.swift
//  Programmatic
//
//  Created by 黄泽皓 on 2019/4/17.
//  Copyright © 2019 cn.zehaohuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nextButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nextButton)
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(pulseButton(_:)), for: .touchDown)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func nextButtonTapped() {
        let nextScreen = SecondViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }

    @objc func pulseButton(_ sender: UIButton) {
        sender.pulse()
    }
}

extension UIButton {

    @objc func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.9
        pulse.toValue = 1.0
        pulse.initialVelocity = 0.9
        pulse.damping = 1.0

        layer.add(pulse, forKey: nil)
    }

}

