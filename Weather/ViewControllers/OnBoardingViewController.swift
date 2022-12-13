//
//  OnBoardingViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    //MARK: - Variables
    
    private(set) var coordinator: MainCoordinator
    
    var headImage = UIImageView()
    
    let firstTextLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.973, green: 0.961, blue: 0.961, alpha: 1)
        view.font = UIFont(name: "Rubik-SemiBold", size: 16)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.11
        paragraphStyle.alignment = .center
        view.attributedText = NSMutableAttributedString(string: "Разрешить приложению  Weather использовать данные \nо местоположении вашего устройства ", attributes: [NSAttributedString.Key.kern: 0.16, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    let secondTextLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        paragraphStyle.alignment = .center
        view.attributedText = NSMutableAttributedString(string: "Чтобы получить более точные прогнозы погоды во время движения или путешествия", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    let thirdTextLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 14)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        paragraphStyle.alignment = .center
        view.attributedText = NSMutableAttributedString(string: "Вы можете изменить свой выбор в любое время из меню приложения", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    
    let getLocationAccessButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.backgroundColor = UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        var buttonConfiguration = UIButton.Configuration.borderless()
        buttonConfiguration.title = "ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ УСТРОЙСТВА"
        buttonConfiguration.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            outgoing.font = UIFont(name: "Rubik-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
            return outgoing
          }
        view.configuration = buttonConfiguration
        return view
    }()
    
    var cancelButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        var buttonConfiguration = UIButton.Configuration.borderless()
        buttonConfiguration.title = "НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ"
        buttonConfiguration.titleAlignment = .leading
        buttonConfiguration.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.foregroundColor = UIColor(red: 0.992, green: 0.986, blue: 0.963, alpha: 1)
            outgoing.font = UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
            return outgoing
          }
        view.configuration = buttonConfiguration
        return view
    }()
    
    //MARK: - Init
    
    init(coordinator: MainCoordinator){
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    //MARK: - Func

    private func setView() {
        view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        
        addElements()
    }
    
    private func addElements() {
        view.addSubview(headImage)
        headImage.translatesAutoresizingMaskIntoConstraints = false
        headImage.image = UIImage(named: "onBoardingImage")
        
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(thirdTextLabel)
        view.addSubview(getLocationAccessButton)
        view.addSubview(cancelButton)
        
        getLocationAccessButton.addTarget(self, action: #selector(getLocationAccess), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc private func getLocationAccess() {
        let locationManager = LocationManager()
        locationManager.requestAuthorization()
        SettingsManager.shared.onboardingIsCleared = true
        coordinator.startApplication()
    }
    
    @objc private func cancelAction() {
        SettingsManager.shared.onboardingIsCleared = true
        coordinator.startApplication()
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        headImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        headImage.heightAnchor.constraint(equalToConstant: 196).isActive = true
        headImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 148).isActive = true
        
        firstTextLabel.widthAnchor.constraint(equalToConstant: 322).isActive = true
        firstTextLabel.heightAnchor.constraint(equalToConstant: 68).isActive = true
        firstTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400).isActive = true
        
        secondTextLabel.widthAnchor.constraint(equalToConstant: 314).isActive = true
        secondTextLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        secondTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 519).isActive = true
        
        thirdTextLabel.widthAnchor.constraint(equalToConstant: 314).isActive = true
        thirdTextLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        thirdTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 569).isActive = true
        
        getLocationAccessButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        getLocationAccessButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        getLocationAccessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getLocationAccessButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 649).isActive = true
        
        cancelButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: getLocationAccessButton.trailingAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 714).isActive = true
    }

}






