//
//  CityControllerHeader.swift
//  Weather
//
//  Created by Дмитрий Федотов on 14.12.2022.
//

import UIKit

class CityControllerHeader: UIView {
    
    //MARK: - Variables
    
    var dayMiniModel: DayMiniModel?
    
    var model: DayMiniModel {
        get {
            return dayMiniModel ?? DayMiniModel.getEmptyModel()
        }
    }
    
    var containerView = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    var sunTrackImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sunTrackImage")
        return view
    }()
    
    var sunriseImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sunriseIcon")
        return view
    }()
    
    var sunsetImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sunsetIcon")
        return view
    }()
    
    lazy var minMaxTempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "\(model.minTemp)° /\(model.maxTemp)°", attributes: [NSAttributedString.Key.kern: 0.32, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.textAlignment = .center
        return view
    }()
    
    lazy var currentTempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 36)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.94
        view.attributedText = NSMutableAttributedString(string: "\(model.curTemp)°", attributes: [NSAttributedString.Key.kern: 3.06, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        view.textAlignment = .center
        return view
    }()
    
    lazy var weatherDescriptionLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "\(model.weatherDescription)", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    lazy var precipitationIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayPrecipitationIcon")
        return view
    }()
    lazy var precipitationLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        view.attributedText = NSMutableAttributedString(string: "\(model.precipitation)", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var humidityIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayHumidityIcon")
        return view
    }()
    lazy var humidityLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        view.attributedText = NSMutableAttributedString(string: "\(model.windSpeed) %", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var windIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    lazy var windLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        view.attributedText = NSMutableAttributedString(string: "\(model.humidity) м\\с", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var dayDescriptionLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.965, green: 0.867, blue: 0.004, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        paragraphStyle.alignment = .center
        view.attributedText = NSMutableAttributedString(string: "\(model.dayDescription) %", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var sunriseTimeLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "\(model.sunriseTime)", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var sunsetTimeLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "\(model.sunsetTime)", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(dayMiniModel: DayMiniModel) {
        self.init(frame: .zero)
        self.dayMiniModel = dayMiniModel
        self.setupView()
    }
    
    
    //MARK: - Functions
    
    private func setupView() {
        backgroundColor = .white
        
        addElements()
    }
    
    func setupModelData (model: DayMiniModel) {
        minMaxTempLabel.text = "\(model.minTemp)° /\(model.maxTemp)°"
        currentTempLabel.text = "\(model.curTemp)°"
        weatherDescriptionLabel.text = "\(model.weatherDescription)"
        precipitationLabel.text = "\(model.precipitation)"
        humidityLabel.text =  "\(model.windSpeed) %"
        windLabel.text = "\(model.humidity) м\\с"
        dayDescriptionLabel.text = "\(model.dayDescription) %"
        sunriseTimeLabel.text = "\(model.sunriseTime)"
        sunsetTimeLabel.text = "\(model.sunsetTime)"
    }
    
    private func addElements() {
        
        addSubview(containerView)
        containerView.addSubview(sunTrackImageView)
        containerView.addSubview(sunriseImageView)
        containerView.addSubview(sunsetImageView)
        containerView.addSubview(minMaxTempLabel)
        containerView.addSubview(currentTempLabel)
        containerView.addSubview(weatherDescriptionLabel)
        containerView.addSubview(precipitationIcon)
        containerView.addSubview(precipitationLabel)
        containerView.addSubview(windIcon)
        containerView.addSubview(windLabel)
        containerView.addSubview(humidityIcon)
        containerView.addSubview(humidityLabel)
        containerView.addSubview(dayDescriptionLabel)
        containerView.addSubview(sunriseTimeLabel)
        containerView.addSubview(sunsetTimeLabel)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 344),
            containerView.heightAnchor.constraint(equalToConstant: 212),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            sunTrackImageView.widthAnchor.constraint(equalToConstant: 280),
            sunTrackImageView.heightAnchor.constraint(equalToConstant: 123),
            sunTrackImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 33),
            sunTrackImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -31),
            sunTrackImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 17),
            
            sunriseImageView.widthAnchor.constraint(equalToConstant: 17),
            sunriseImageView.heightAnchor.constraint(equalToConstant: 17),
            sunriseImageView.centerXAnchor.constraint(equalTo: sunTrackImageView.leadingAnchor),
            sunriseImageView.topAnchor.constraint(equalTo: sunTrackImageView.bottomAnchor, constant: 3),
            
            sunsetImageView.widthAnchor.constraint(equalToConstant: 17),
            sunsetImageView.heightAnchor.constraint(equalToConstant: 17),
            sunsetImageView.centerXAnchor.constraint(equalTo: sunTrackImageView.trailingAnchor),
            sunsetImageView.topAnchor.constraint(equalTo: sunTrackImageView.bottomAnchor, constant: 3),
            
            minMaxTempLabel.widthAnchor.constraint(equalToConstant: 80),
            minMaxTempLabel.heightAnchor.constraint(equalToConstant: 20),
            minMaxTempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            minMaxTempLabel.topAnchor.constraint(equalTo: sunTrackImageView.topAnchor, constant: 16),
            
            currentTempLabel.widthAnchor.constraint(equalToConstant: 100),
            currentTempLabel.heightAnchor.constraint(equalToConstant: 40),
            currentTempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currentTempLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 58),
            
            weatherDescriptionLabel.widthAnchor.constraint(equalToConstant: 250),
            weatherDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            weatherDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherDescriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 103),
            
            precipitationIcon.widthAnchor.constraint(equalToConstant: 21),
            precipitationIcon.heightAnchor.constraint(equalToConstant: 18),
            precipitationIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 77),
            precipitationIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 138),
            
            precipitationLabel.widthAnchor.constraint(equalToConstant: 36),
            precipitationLabel.heightAnchor.constraint(equalToConstant: 18),
            precipitationLabel.leadingAnchor.constraint(equalTo: precipitationIcon.leadingAnchor, constant: 26),
            precipitationLabel.topAnchor.constraint(equalTo: precipitationIcon.topAnchor),
            
            windIcon.widthAnchor.constraint(equalToConstant: 25),
            windIcon.heightAnchor.constraint(equalToConstant: 18),
            windIcon.leadingAnchor.constraint(equalTo: precipitationIcon.leadingAnchor, constant: 55),
            windIcon.topAnchor.constraint(equalTo: precipitationIcon.topAnchor),
            
            windLabel.widthAnchor.constraint(equalToConstant: 36),
            windLabel.heightAnchor.constraint(equalToConstant: 18),
            windLabel.leadingAnchor.constraint(equalTo: windIcon.trailingAnchor, constant: 10),
            windLabel.topAnchor.constraint(equalTo: precipitationIcon.topAnchor),
            
            humidityIcon.widthAnchor.constraint(equalToConstant: 13),
            humidityIcon.heightAnchor.constraint(equalToConstant: 18),
            humidityIcon.leadingAnchor.constraint(equalTo: precipitationIcon.leadingAnchor, constant: 150),
            humidityIcon.topAnchor.constraint(equalTo: precipitationIcon.topAnchor),
            
            humidityLabel.widthAnchor.constraint(equalToConstant: 36),
            humidityLabel.heightAnchor.constraint(equalToConstant: 18),
            humidityLabel.leadingAnchor.constraint(equalTo: precipitationIcon.leadingAnchor, constant: 170),
            humidityLabel.topAnchor.constraint(equalTo: precipitationIcon.topAnchor),
            
            dayDescriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            dayDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            dayDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dayDescriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 171),
            
            sunriseTimeLabel.widthAnchor.constraint(equalToConstant: 40),
            sunriseTimeLabel.heightAnchor.constraint(equalToConstant: 17),
            sunriseTimeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 17),
            sunriseTimeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 167),
            
            sunsetTimeLabel.widthAnchor.constraint(equalToConstant: 40),
            sunsetTimeLabel.heightAnchor.constraint(equalToConstant: 17),
            sunsetTimeLabel.centerXAnchor.constraint(equalTo: sunTrackImageView.trailingAnchor),
            sunsetTimeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 167),
        ])
    }
    
}
