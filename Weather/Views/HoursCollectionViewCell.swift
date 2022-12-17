//
//  HoursCollectionViewCell.swift
//  Weather
//
//  Created by Дмитрий Федотов on 17.12.2022.
//

import UIKit

class HoursCollectionViewCell: UICollectionViewCell {
    
    var hourIconModel: HourIconModel?
    
    var model: HourIconModel {
        get {
            return hourIconModel ?? HourIconModel.getEmptyModel()
        }
    }
    
    lazy private var timeLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        return view
    }()
    
    lazy private var tempLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
        return view
    }()
    
    private let hoursIconContainer = {
        var view = UILabel()
        //view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 0.671, green: 0.737, blue: 0.918, alpha: 1).cgColor
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        //view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        //contentView.backgroundColor = .yellow
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    convenience init(hourIconModel: HourIconModel) {
//        self.init(frame: .zero)
//        //self.hourIconModel = hourIconModel
//        self.layout()
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = UIImage()
    }
    
    func setupCell(hourIconModel: HourIconModel) {
        //iconImageView.image = photoImage
        self.hourIconModel = hourIconModel
        timeLabel.text = model.hourDescription
        iconImageView.image = WeatherIconManager.getIcon(for: model.weatherState)
        tempLabel.text = "\(model.temp)°"
    }
    
    private func layout() {
        contentView.addSubview(hoursIconContainer)
        hoursIconContainer.addSubview(timeLabel)
        hoursIconContainer.addSubview(iconImageView)
        hoursIconContainer.addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            hoursIconContainer.heightAnchor.constraint(equalToConstant: 84),
            hoursIconContainer.widthAnchor.constraint(equalToConstant: 45),
            hoursIconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hoursIconContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            timeLabel.widthAnchor.constraint(equalToConstant: 40),
            timeLabel.centerXAnchor.constraint(equalTo: hoursIconContainer.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: hoursIconContainer.topAnchor, constant: 15),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 16),
            iconImageView.centerXAnchor.constraint(equalTo: hoursIconContainer.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            
            tempLabel.heightAnchor.constraint(equalToConstant: 20),
            tempLabel.widthAnchor.constraint(equalToConstant: 18),
            tempLabel.centerXAnchor.constraint(equalTo: hoursIconContainer.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: hoursIconContainer.topAnchor, constant: 57),
            
        ])
    }
}
