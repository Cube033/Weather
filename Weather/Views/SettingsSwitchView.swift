//
//  SettingsSwitch.swift
//  Weather
//
//  Created by Дмитрий Федотов on 27.12.2022.
//

import UIKit

class SettingsSwitchView: UIView {
    
    enum SettingsSwitchState {
        case state1
        case state2
    }
    
    private let buttunFont = UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
    private let onSwitchBackgroundColor = UIColor(red: 0.122, green: 0.302, blue: 0.773, alpha: 1)
    private let offSwitchBackgroundColor = UIColor(red: 0.996, green: 0.929, blue: 0.914, alpha: 1)
    private let onSwitchTextColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
    private let offSwitchTextColor = UIColor(red: 0.153, green: 0.153, blue: 0.133, alpha: 1)
    
    private var text1: String = ""
    private var text2: String = ""
    
    var currentSettingsSwitchState: SettingsSwitchState
    
    private var complition: (() -> Void)?
    
    private let leftButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rightButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        currentSettingsSwitchState = .state1
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(settingName: String, text1: String, text2: String, complition: (() -> Void)?) {
        self.init(frame: .zero)
        self.complition = complition
        self.text1 = text1
        self.text2 = text2
        
        restoreSetting(settingName: settingName)
        setupView()
    }
    
    private func restoreSetting(settingName: String) {
        switch settingName {
        case "tempetatureFormat":
            currentSettingsSwitchState = SettingsManager.shared.tempetatureFormat == .celsius ? .state1 : .state2
        case "measurementType":
            currentSettingsSwitchState = SettingsManager.shared.measurementType == .miles ? .state1 : .state2
        case "timeFormat":
            currentSettingsSwitchState = SettingsManager.shared.timeFormat == .format12 ? .state1 : .state2
        case "notificationsIsOn":
            currentSettingsSwitchState = SettingsManager.shared.notificationsIsOn ? .state1 : .state2
        default:
            return
        }
    }
    
    private func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 5
        layer.masksToBounds = true
        leftButton.addTarget(self, action: #selector (buttonAction), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector (buttonAction), for: .touchUpInside)
        setupButtons()
        setConstraints()
    }
    
    private func setConstraints(){
        addSubview(leftButton)
        addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftButton.topAnchor.constraint(equalTo: self.topAnchor),
            leftButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            leftButton.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            
            rightButton.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            rightButton.topAnchor.constraint(equalTo: self.topAnchor),
            rightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func setupButtons(){
        let textOn = state(1) ? text1 : text2
        let textOff = state(2) ? text1 : text2
        let attributedStringOn = NSAttributedString(string: NSLocalizedString(textOn, comment: ""), attributes:[
            NSAttributedString.Key.font : buttunFont,
            NSAttributedString.Key.foregroundColor : onSwitchTextColor,
        ])
        let attributedStringOff = NSAttributedString(string: NSLocalizedString(textOff, comment: ""), attributes:[
            NSAttributedString.Key.font : buttunFont,
            NSAttributedString.Key.foregroundColor : offSwitchTextColor,
        ])
        leftButton.backgroundColor = state(1) ? onSwitchBackgroundColor : offSwitchBackgroundColor
        rightButton.backgroundColor = state(2) ? onSwitchBackgroundColor : offSwitchBackgroundColor
        leftButton.setAttributedTitle(state(1) ? attributedStringOn : attributedStringOff, for: .normal)
        rightButton.setAttributedTitle(state(2) ? attributedStringOn : attributedStringOff, for: .normal)
        
    }
    
    @objc private func buttonAction() {
        toggle()
        guard let complitionExist = complition else {return}
        complitionExist()
    }
    
    private func state(_ stateNum: Int) -> Bool {
        if stateNum == 1 {
            return currentSettingsSwitchState == .state1
        } else {
            return currentSettingsSwitchState == .state2
        }
    }
    
    func toggle() {
        currentSettingsSwitchState = state(1) ? .state2 : .state1
        setupButtons()
    }
}
