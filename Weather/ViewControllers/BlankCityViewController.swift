//
//  BlankCityViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class BlankCityViewController: UIViewController {

    let addCityButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .black
        view.setImage(UIImage(named: "CityPlusIcon"), for: .normal)
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
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            addCityButton.widthAnchor.constraint(equalToConstant: 250),
//            addCityButton.heightAnchor.constraint(equalToConstant: 250),
            addCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addCityButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
//            addCityButton.imageView!.widthAnchor.constraint(equalToConstant: 250),
//            addCityButton.imageView!.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
}
