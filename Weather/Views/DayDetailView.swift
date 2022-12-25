//
//  DayDetailView.swift
//  Weather
//
//  Created by Дмитрий Федотов on 23.12.2022.
//

import UIKit

class DayDetailView: UIView {
    
    let containerView = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    let dayLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "День", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayWeatherStateIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayTempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 30)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        view.attributedText = NSMutableAttributedString(string: "13", attributes: [NSAttributedString.Key.kern: 0.6, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayWeatherDescription = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "Ливни", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayFeelTempIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayWindIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayUFIndexIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayHumidityIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayCloudnessIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    let dayFeelTempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "По ощущениям ", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayWindLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Ветер", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayUFIndexLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Уф индекс", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayHumidityLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Дождь", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayCloudnessLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Облачность", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayFeelTempValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "11", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayWindValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "5 m\\s ЗЮЗ", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayUFIndexValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "4( умерен.)", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayHumidityValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "55%", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let dayCloudnessValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "72%", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
        translatesAutoresizingMaskIntoConstraints = false
        addElements()
    }
    
    private func addElements() {
        
        addSubview(containerView)
        containerView.addSubview(dayLabel)
        containerView.addSubview(dayWeatherStateIcon)
        containerView.addSubview(dayTempLabel)
        containerView.addSubview(dayWeatherDescription)
        containerView.addSubview(dayFeelTempIcon)
        containerView.addSubview(dayWindIcon)
        containerView.addSubview(dayUFIndexIcon)
        containerView.addSubview(dayHumidityIcon)
        containerView.addSubview(dayCloudnessIcon)
        containerView.addSubview(dayFeelTempLabel)
        containerView.addSubview(dayWindLabel)
        containerView.addSubview(dayUFIndexLabel)
        containerView.addSubview(dayHumidityLabel)
        containerView.addSubview(dayCloudnessLabel)
        containerView.addSubview(dayFeelTempValueLabel)
        containerView.addSubview(dayWindValueLabel)
        containerView.addSubview(dayUFIndexValueLabel)
        containerView.addSubview(dayHumidityValueLabel)
        containerView.addSubview(dayCloudnessValueLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -15),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30),
            //containerView.heightAnchor.constraint(equalToConstant: 341),
            
            dayLabel.widthAnchor.constraint(equalToConstant: 43),
            dayLabel.heightAnchor.constraint(equalToConstant: 22),
            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 21),
            
            dayWeatherStateIcon.widthAnchor.constraint(equalToConstant: 36),
            dayWeatherStateIcon.heightAnchor.constraint(equalToConstant: 36),
            dayWeatherStateIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 134),
            dayWeatherStateIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            
            dayTempLabel.widthAnchor.constraint(equalToConstant: 32),
            dayTempLabel.heightAnchor.constraint(equalToConstant: 35),
            dayTempLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 180),
            dayTempLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            
            dayWeatherDescription.widthAnchor.constraint(equalToConstant: 200),
            dayWeatherDescription.heightAnchor.constraint(equalToConstant: 22),
            dayWeatherDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 145),
            dayWeatherDescription.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 62),
            
            dayFeelTempIcon.widthAnchor.constraint(equalToConstant: 24),
            dayFeelTempIcon.heightAnchor.constraint(equalToConstant: 26),
            dayFeelTempIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayFeelTempIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 109),
            
            dayWindIcon.widthAnchor.constraint(equalToConstant: 24),
            dayWindIcon.heightAnchor.constraint(equalToConstant: 26),
            dayWindIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayWindIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 161),
            
            dayUFIndexIcon.widthAnchor.constraint(equalToConstant: 24),
            dayUFIndexIcon.heightAnchor.constraint(equalToConstant: 26),
            dayUFIndexIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayUFIndexIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 204),
            
            dayHumidityIcon.widthAnchor.constraint(equalToConstant: 24),
            dayHumidityIcon.heightAnchor.constraint(equalToConstant: 26),
            dayHumidityIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayHumidityIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 246),
            
            dayCloudnessIcon.widthAnchor.constraint(equalToConstant: 24),
            dayCloudnessIcon.heightAnchor.constraint(equalToConstant: 26),
            dayCloudnessIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            dayCloudnessIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 298),
            dayCloudnessIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -27),
            
            dayFeelTempLabel.widthAnchor.constraint(equalToConstant: 104),
            dayFeelTempLabel.heightAnchor.constraint(equalToConstant: 19),
            dayFeelTempLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            dayFeelTempLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 112),
            
            dayWindLabel.widthAnchor.constraint(equalToConstant: 42),
            dayWindLabel.heightAnchor.constraint(equalToConstant: 19),
            dayWindLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            dayWindLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 158),
            
            dayUFIndexLabel.widthAnchor.constraint(equalToConstant: 72),
            dayUFIndexLabel.heightAnchor.constraint(equalToConstant: 19),
            dayUFIndexLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            dayUFIndexLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 204),
            
            dayHumidityLabel.widthAnchor.constraint(equalToConstant: 46),
            dayHumidityLabel.heightAnchor.constraint(equalToConstant: 19),
            dayHumidityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            dayHumidityLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 247),
            
            dayCloudnessLabel.widthAnchor.constraint(equalToConstant: 81),
            dayCloudnessLabel.heightAnchor.constraint(equalToConstant: 19),
            dayCloudnessLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 54),
            dayCloudnessLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 293),
            
            dayFeelTempValueLabel.widthAnchor.constraint(equalToConstant: 16),
            dayFeelTempValueLabel.heightAnchor.constraint(equalToConstant: 22),
            dayFeelTempValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            dayFeelTempValueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 109),
            
            dayWindValueLabel.widthAnchor.constraint(equalToConstant: 91),
            dayWindValueLabel.heightAnchor.constraint(equalToConstant: 22),
            dayWindValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            dayWindValueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 155),
            
            dayUFIndexValueLabel.widthAnchor.constraint(equalToConstant: 95),
            dayUFIndexValueLabel.heightAnchor.constraint(equalToConstant: 22),
            dayUFIndexValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            dayUFIndexValueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 201),
            
            dayHumidityValueLabel.widthAnchor.constraint(equalToConstant: 35),
            dayHumidityValueLabel.heightAnchor.constraint(equalToConstant: 22),
            dayHumidityValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            dayHumidityValueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 247),
            
            dayCloudnessValueLabel.widthAnchor.constraint(equalToConstant: 34),
            dayCloudnessValueLabel.heightAnchor.constraint(equalToConstant: 22),
            dayCloudnessValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            dayCloudnessValueLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 292),
            
        ])
    }
}
