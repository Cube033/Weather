//
//  BlankCityViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class BlankCityViewController: UIViewController {

    var mainCoordinator: MainCoordinator?
    
    lazy var addCityButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "CityPlusIcon"), for: .normal)
        view.addTarget(self, action: #selector(addCityButtonTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        view.backgroundColor = .white
        addElements()
    }
    
    private func addElements() {
        view.addSubview(addCityButton)
        setConstraints()
    }
    
    @objc private func addCityButtonTapped() {
        mainCoordinator?.addCityButtonTapped(viewController: self)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addCityButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
