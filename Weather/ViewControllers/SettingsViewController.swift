//
//  SettingsViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    let backgroundCloudImage1 = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "backgroundCloudImage1")
        return view
    }()
    let backgroundCloudImage2 = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "backgroundCloudImage2")
        return view
    }()
    let backgroundCloudImage3 = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "backgroundCloudImage3")
        return view
    }()
    
    let containerView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    let settingsLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.153, green: 0.153, blue: 0.133, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.7
        view.attributedText = NSMutableAttributedString(string: "Настройки", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let tempSettingsLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Температура", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let windSpeedLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Скорость ветра", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let timeFormatLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Формат времени", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let notificationLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 16)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        view.attributedText = NSMutableAttributedString(string: "Уведомление", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let setButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        let attributedString = NSAttributedString(string: NSLocalizedString("Установить", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1),
        ])
        view.setAttributedTitle(attributedString, for: .normal)
        return view
    }()
    let tempSwitch = SettingsSwitchView(settingName: "tempetatureFormat", text1: "C", text2: "F", complition: nil)
    let speedWindSwitch = SettingsSwitchView(settingName: "measurementType", text1: "Mi", text2: "Km", complition: nil)
    let timeFormatSwitch = SettingsSwitchView(settingName: "timeFormat", text1: "12", text2: "24", complition: nil)
    let notificationSwitch = SettingsSwitchView(settingName: "notificationsIsOn", text1: "On", text2: "Off", complition: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
    
    private func setView() {
        view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        
        setButton.addTarget(self, action: #selector(setButtonAction), for: .touchUpInside)
        
        addElements()
    }
    
    @objc private func setButtonAction() {
        print("🍀🍀🍀🍀🍀🍀🍀")
        printUserDefults()
        print("🐙🐙🐙🐙🐙🐙🐙")
        storeSettings()
        printUserDefults()
        print("🦊🦊🦊🦊🦊🦊🦊")
        navigationController?.popViewController(animated: true)
    }
    
    private func storeSettings() {
        SettingsManager.shared.tempetatureFormat = tempSwitch.currentSettingsSwitchState == .state1 ? .celsius : .fahrenheit
        SettingsManager.shared.measurementType = speedWindSwitch.currentSettingsSwitchState == .state1 ? .miles : .kilometers
        SettingsManager.shared.timeFormat = timeFormatSwitch.currentSettingsSwitchState == .state1 ? .format12
        : .format24
        SettingsManager.shared.notificationsIsOn = notificationSwitch.currentSettingsSwitchState == .state1
    }
    
    private func printUserDefults() {
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
    }
    
    private func addElements(){
        self.view.addSubview(backgroundCloudImage1)
        self.view.addSubview(backgroundCloudImage2)
        self.view.addSubview(backgroundCloudImage3)
        self.view.addSubview(containerView)
        containerView.addSubview(settingsLabel)
        containerView.addSubview(tempSettingsLabel)
        containerView.addSubview(windSpeedLabel)
        containerView.addSubview(timeFormatLabel)
        containerView.addSubview(notificationLabel)
        containerView.addSubview(setButton)
        containerView.addSubview(tempSwitch)
        containerView.addSubview(speedWindSwitch)
        containerView.addSubview(timeFormatSwitch)
        containerView.addSubview(notificationSwitch)
        
        
        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCloudImage1.widthAnchor.constraint(equalToConstant: 245),
            backgroundCloudImage1.heightAnchor.constraint(equalToConstant: 58),
            backgroundCloudImage1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundCloudImage1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 37),
            
            backgroundCloudImage2.widthAnchor.constraint(equalToConstant: 182),
            backgroundCloudImage2.heightAnchor.constraint(equalToConstant: 94),
            backgroundCloudImage2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundCloudImage2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 121),
            
            backgroundCloudImage3.widthAnchor.constraint(equalToConstant: 217),
            backgroundCloudImage3.heightAnchor.constraint(equalToConstant: 65),
            backgroundCloudImage3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -79),
            backgroundCloudImage3.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -95),
            
            containerView.widthAnchor.constraint(equalToConstant: 320),
            containerView.heightAnchor.constraint(equalToConstant: 330),
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 241),
            
            settingsLabel.widthAnchor.constraint(equalToConstant: 112),
            settingsLabel.heightAnchor.constraint(equalToConstant: 20),
            settingsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            settingsLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 27),
            
            tempSettingsLabel.widthAnchor.constraint(equalToConstant: 112),
            tempSettingsLabel.heightAnchor.constraint(equalToConstant: 20),
            tempSettingsLabel.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            tempSettingsLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 62),
            
            windSpeedLabel.widthAnchor.constraint(equalToConstant: 129),
            windSpeedLabel.heightAnchor.constraint(equalToConstant: 20),
            windSpeedLabel.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            windSpeedLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 112),
            
            timeFormatLabel.widthAnchor.constraint(equalToConstant: 138),
            timeFormatLabel.heightAnchor.constraint(equalToConstant: 20),
            timeFormatLabel.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            timeFormatLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 162),
            
            notificationLabel.widthAnchor.constraint(equalToConstant: 112),
            notificationLabel.heightAnchor.constraint(equalToConstant: 20),
            notificationLabel.leadingAnchor.constraint(equalTo: settingsLabel.leadingAnchor),
            notificationLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 212),
            
            setButton.widthAnchor.constraint(equalToConstant: 250),
            setButton.heightAnchor.constraint(equalToConstant: 40),
            setButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            setButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            tempSwitch.widthAnchor.constraint(equalToConstant: 80),
            tempSwitch.heightAnchor.constraint(equalToConstant: 30),
            tempSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            tempSwitch.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 57),
            
            speedWindSwitch.widthAnchor.constraint(equalToConstant: 80),
            speedWindSwitch.heightAnchor.constraint(equalToConstant: 30),
            speedWindSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            speedWindSwitch.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 107),
            
            timeFormatSwitch.widthAnchor.constraint(equalToConstant: 80),
            timeFormatSwitch.heightAnchor.constraint(equalToConstant: 30),
            timeFormatSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            timeFormatSwitch.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 157),
            
            notificationSwitch.widthAnchor.constraint(equalToConstant: 80),
            notificationSwitch.heightAnchor.constraint(equalToConstant: 30),
            notificationSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            notificationSwitch.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 207),
        ])
    }
}
