//
//  HoursControllerCell.swift
//  Weather
//
//  Created by Дмитрий Федотов on 20.12.2022.
//

import UIKit

class HoursControllerCell: UITableViewCell {

    //MARK: - Variables
    var containerView = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
        return view
    }()
    var dateLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "пт 16/04", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var timeLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "15:00", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var tempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.textAlignment = .center
        view.attributedText = NSMutableAttributedString(string: "12°", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var weatherStateIcon  = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayHumidityIcon")
        return view
    }()
    var windIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayWindIcon")
        return view
    }()
    var humidityIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayHumidityIcon")
        return view
    }()
    var cloudnessIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "weatherIconDarkCloud")
        return view
    }()
    var weatherDescriptionLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Облачно", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var windLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Ветер", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var humidityLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "Атмосферные осадки", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view

    }()
    var cloudnessLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.96
        view.attributedText = NSMutableAttributedString(string: "Облачность", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var feelTempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "По ощущению", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var feelTempValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.attributedText = NSMutableAttributedString(string: "10°", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var windDescriptionLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.15
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "2 m/s CCЗ", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var humidityValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.96
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "0%", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var cloudnessValueLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.96
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "29%", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    var underLineImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "blueLine")
        return view
    }()
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    //MARK: - Functions
    
    func setupCell(model: DayMiniModel) {
        dateLabel.text = ""
        timeLabel.text = ""
        tempLabel.text = ""
        weatherDescriptionLabel.text = ""
        feelTempValueLabel.text = ""
        windDescriptionLabel.text = ""
        humidityValueLabel.text = ""
        cloudnessLabel.text = ""
        weatherStateIcon.image = WeatherIconManager.getIcon(for: .sun)
        
//        dateLabel.text = model.dayShortDescription
//        humidityLabel.text = "\(model.humidity)%"
//        weatherDescriptionLabel.text = model.weatherDescription
//        tempRangeLabel.text = "\(model.minTemp)°-\(model.maxTemp)°"
    }
    
    override func prepareForReuse() {
        setupCell(model: DayMiniModel.getEmptyModel())
    }

    //MARK: - Constraints
    private func layout() {
        contentView.addSubview(containerView)
        [
            dateLabel,
            timeLabel,
            tempLabel,
            weatherStateIcon,
            windIcon,
            humidityIcon,
            cloudnessIcon,
            weatherDescriptionLabel,
            windLabel,
            humidityLabel,
            cloudnessLabel,
            feelTempLabel,
            feelTempValueLabel,
            windDescriptionLabel,
            humidityValueLabel,
            cloudnessValueLabel,
            underLineImageView
        ].forEach {containerView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 150),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 79),
            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            
            timeLabel.widthAnchor.constraint(equalToConstant: 47),
            timeLabel.heightAnchor.constraint(equalToConstant: 19),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 45),
            
            tempLabel.widthAnchor.constraint(equalToConstant: 20),
            tempLabel.heightAnchor.constraint(equalToConstant: 22),
            tempLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            tempLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 74),
            
            weatherStateIcon.widthAnchor.constraint(equalToConstant: 12),
            weatherStateIcon.heightAnchor.constraint(equalToConstant: 12),
            weatherStateIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 75),
            weatherStateIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 48),
            
            windIcon.widthAnchor.constraint(equalToConstant: 12),
            windIcon.heightAnchor.constraint(equalToConstant: 12),
            windIcon.leadingAnchor.constraint(equalTo: weatherStateIcon.leadingAnchor),
            windIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 76),
            
            humidityIcon.widthAnchor.constraint(equalToConstant: 12),
            humidityIcon.heightAnchor.constraint(equalToConstant: 12),
            humidityIcon.leadingAnchor.constraint(equalTo: weatherStateIcon.leadingAnchor),
            humidityIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 103),
            
            cloudnessIcon.widthAnchor.constraint(equalToConstant: 12),
            cloudnessIcon.heightAnchor.constraint(equalToConstant: 12),
            cloudnessIcon.leadingAnchor.constraint(equalTo: weatherStateIcon.leadingAnchor),
            cloudnessIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 126),
            
            weatherDescriptionLabel.widthAnchor.constraint(equalToConstant: 155),
            weatherDescriptionLabel.heightAnchor.constraint(equalToConstant: 15),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 90),
            weatherDescriptionLabel.topAnchor.constraint(equalTo: weatherStateIcon.topAnchor),
            
            windLabel.widthAnchor.constraint(equalToConstant: 50),
            windLabel.heightAnchor.constraint(equalToConstant: 19),
            windLabel.leadingAnchor.constraint(equalTo: weatherDescriptionLabel.leadingAnchor),
            windLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 72),
            
            humidityLabel.widthAnchor.constraint(equalToConstant: 158),
            humidityLabel.heightAnchor.constraint(equalToConstant: 19),
            humidityLabel.leadingAnchor.constraint(equalTo: weatherDescriptionLabel.leadingAnchor),
            humidityLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 99),
            
            cloudnessLabel.widthAnchor.constraint(equalToConstant: 128),
            cloudnessLabel.heightAnchor.constraint(equalToConstant: 16),
            cloudnessLabel.leadingAnchor.constraint(equalTo: weatherDescriptionLabel.leadingAnchor),
            cloudnessLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 126),
            
            feelTempLabel.widthAnchor.constraint(equalToConstant: 100),
            feelTempLabel.heightAnchor.constraint(equalToConstant: 19),
            feelTempLabel.leadingAnchor.constraint(equalTo: weatherStateIcon.trailingAnchor, constant: 160),
            feelTempLabel.topAnchor.constraint(equalTo: weatherStateIcon.topAnchor),
            
            feelTempValueLabel.widthAnchor.constraint(equalToConstant: 30),
            feelTempValueLabel.heightAnchor.constraint(equalToConstant: 19),
            feelTempValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            feelTempValueLabel.topAnchor.constraint(equalTo: weatherStateIcon.topAnchor),
            
            windDescriptionLabel.widthAnchor.constraint(equalToConstant: 76),
            windDescriptionLabel.heightAnchor.constraint(equalToConstant: 19),
            windDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            windDescriptionLabel.topAnchor.constraint(equalTo: windLabel.topAnchor),
            
            humidityValueLabel.widthAnchor.constraint(equalToConstant: 76),
            humidityValueLabel.heightAnchor.constraint(equalToConstant: 16),
            humidityValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            humidityValueLabel.topAnchor.constraint(equalTo: humidityLabel.topAnchor),
            
            cloudnessValueLabel.widthAnchor.constraint(equalToConstant: 76),
            cloudnessValueLabel.heightAnchor.constraint(equalToConstant: 16),
            cloudnessValueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            cloudnessValueLabel.topAnchor.constraint(equalTo: cloudnessLabel.topAnchor),
            
            underLineImageView.heightAnchor.constraint(equalToConstant: 1),
            underLineImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            underLineImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            underLineImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -1),
            

        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
