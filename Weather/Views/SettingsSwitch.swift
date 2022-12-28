//
//  SettingsSwitch.swift
//  Weather
//
//  Created by Дмитрий Федотов on 27.12.2022.
//

import UIKit

class SettingsSwitch: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init() {
        self.init(frame: .zero)
        
        setupView()
    }
    
    private func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
    }
}
