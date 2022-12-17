//
//  CityControllerDaysHeader.swift
//  Weather
//
//  Created by Дмитрий Федотов on 17.12.2022.
//

import UIKit

class CityControllerDaysHeader: UIView {

    //MARK: - Variables
    
    var containerView = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var dailyLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "Ежедневный прогноз", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    var dailyButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(string: NSLocalizedString("25 дней", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1),
            NSAttributedString.Key.underlineStyle:1.0
        ])
        view.setAttributedTitle(attributedString, for: .normal)
        return view
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Functions
    
    private func setupView() {
        backgroundColor = .white
        
        addElements()
    }
    
    private func addElements() {
        
        addSubview(containerView)
        containerView.addSubview(dailyLabel)
        containerView.addSubview(dailyButton)
        setConstraints()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            
            dailyLabel.widthAnchor.constraint(equalToConstant: 200),
            dailyLabel.heightAnchor.constraint(equalToConstant: 22),
            dailyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dailyLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            dailyButton.widthAnchor.constraint(equalToConstant: 85),
            dailyButton.heightAnchor.constraint(equalToConstant: 20),
            dailyButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dailyButton.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            ])
    }
}
