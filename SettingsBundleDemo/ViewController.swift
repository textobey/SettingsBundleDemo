//
//  ViewController.swift
//  SettingsBundleDemo
//
//  Created by 이서준 on 2023/01/03.
//

import UIKit
import Toast

class ViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ViewController"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        displayCurrentServerInformation()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension ViewController {
    private func displayCurrentServerInformation() {
        switch ServerEnvironmentType.current {
        case .dev: view.makeToast("it's dev enviorment", duration: 5.0, position: .center)
        case .staging: view.makeToast("it's staging enviorment", duration: 5.0, position: .center)
        case .pro: view.makeToast("it's pro enviorment", duration: 5.0, position: .center)
        }
    }
}
