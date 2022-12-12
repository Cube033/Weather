//
//  ViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 12.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView() {
        print(Bundle.main.bundlePath)
        view.backgroundColor = .lightGray
    }

}

