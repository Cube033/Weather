//
//  CityControllerDayCell.swift
//  Weather
//
//  Created by Дмитрий Федотов on 17.12.2022.
//

import UIKit

class CityControllerDayCell: UITableViewCell {

    var viewContainer = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    var dateLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.604, green: 0.587, blue: 0.587, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    var humidityIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dayHumidityIcon")
        return view
    }()
    
    var humidityLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 12)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        view.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.12, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    var weatherDescriptionLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    var tempRangeLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        view.attributedText = NSMutableAttributedString(string: "4 -11", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    var arrowIcon = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "rightArrowIcon")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    func setupCell(model: DayMiniModel) {
        dateLabel.text = model.dayShortDescription
        humidityLabel.text = "\(model.humidity)%"
        weatherDescriptionLabel.text = model.weatherDescription
        tempRangeLabel.text = "\(model.minTemp)°-\(model.maxTemp)°"
    }
    
    override func prepareForReuse() {
        setupCell(model: DayMiniModel.getEmptyModel())
    }

    
    private func layout() {
        contentView.addSubview(viewContainer)
        [
            dateLabel,
            humidityIcon,
            humidityLabel,
            weatherDescriptionLabel,
            tempRangeLabel,
            arrowIcon
        ].forEach {viewContainer.addSubview($0)}
        
        NSLayoutConstraint.activate([
            viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            viewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            viewContainer.heightAnchor.constraint(equalToConstant: 56),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 53),
            dateLabel.heightAnchor.constraint(equalToConstant: 19),
            dateLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 6),
            
            humidityIcon.widthAnchor.constraint(equalToConstant: 15),
            humidityIcon.heightAnchor.constraint(equalToConstant: 17),
            humidityIcon.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 10),
            humidityIcon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            
            humidityLabel.widthAnchor.constraint(equalToConstant: 23),
            humidityLabel.heightAnchor.constraint(equalToConstant: 17),
            humidityLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 30),
            humidityLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 31),
            
            weatherDescriptionLabel.widthAnchor.constraint(equalToConstant: 206),
            weatherDescriptionLabel.heightAnchor.constraint(equalToConstant: 19),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 66),
            weatherDescriptionLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 19),
            
            tempRangeLabel.widthAnchor.constraint(equalToConstant: 43),
            tempRangeLabel.heightAnchor.constraint(equalToConstant: 22),
            tempRangeLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -26),
            tempRangeLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 17),
            
            arrowIcon.widthAnchor.constraint(equalToConstant: 6),
            arrowIcon.heightAnchor.constraint(equalToConstant: 10),
            arrowIcon.leadingAnchor.constraint(equalTo: tempRangeLabel.trailingAnchor, constant: 10),
            arrowIcon.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 23),
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
