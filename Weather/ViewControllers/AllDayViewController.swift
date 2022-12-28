//
//  AllDayViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class AllDayViewController: UIViewController {

    //MARK: - Variables
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let cityLabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
        view.font = UIFont(name: "Rubik-Medium", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "Kharkiv,Ukraine", attributes: [NSAttributedString.Key.kern: 0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    let todayFrameLabel = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    let date1Label = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont(name: "Rubik-Regular", size: 18)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.03
        view.attributedText = NSMutableAttributedString(string: "16/04 ПТ", attributes: [NSAttributedString.Key.kern: -0.18, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return view
    }()
    lazy var date2Button = getDateLabel()
    lazy var date3Button = getDateLabel()
    lazy var date4Button = getDateLabel()
    let dayView = DayDetailView()
    let nightView = DayDetailView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
    
    //MARK: - Functions
    private func getDateLabel() -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(string: NSLocalizedString("01/01 XX", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "Rubik-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1),
            NSAttributedString.Key.underlineStyle:1.0
        ])
        view.setAttributedTitle(attributedString, for: .normal)
        return view
    }
    
    private func setView() {
        view.backgroundColor = .white
        
        addElements()
        setConstraints()
        
        scrollView.contentSize = contentView.frame.size
        
    }
    
    private func addElements(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(cityLabel)
        contentView.addSubview(todayFrameLabel)
        todayFrameLabel.addSubview(date1Label)
        contentView.addSubview(date2Button)
        contentView.addSubview(date3Button)
        contentView.addSubview(date4Button)
        contentView.addSubview(dayView)
        contentView.addSubview(nightView)
    }
    
    //MARK: - Constraints

    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            cityLabel.widthAnchor.constraint(equalToConstant: 200),
            cityLabel.heightAnchor.constraint(equalToConstant: 22),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            todayFrameLabel.widthAnchor.constraint(equalToConstant: 88),
            todayFrameLabel.heightAnchor.constraint(equalToConstant: 36),
            todayFrameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            todayFrameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 67),
            
            date1Label.widthAnchor.constraint(equalToConstant: 76),
            date1Label.heightAnchor.constraint(equalToConstant: 22),
            date1Label.leadingAnchor.constraint(equalTo: todayFrameLabel.leadingAnchor, constant: 6),
            date1Label.topAnchor.constraint(equalTo: todayFrameLabel.topAnchor, constant: 7),
            
            date2Button.widthAnchor.constraint(equalToConstant: 74),
            date2Button.heightAnchor.constraint(equalToConstant: 22),
            date2Button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            date2Button.topAnchor.constraint(equalTo: date1Label.topAnchor),
            
            date3Button.widthAnchor.constraint(equalToConstant: 74),
            date3Button.heightAnchor.constraint(equalToConstant: 22),
            date3Button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 200),
            date3Button.topAnchor.constraint(equalTo: date1Label.topAnchor),
            
            date4Button.widthAnchor.constraint(equalToConstant: 74),
            date4Button.heightAnchor.constraint(equalToConstant: 22),
            date4Button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 300),
            date4Button.topAnchor.constraint(equalTo: date1Label.topAnchor),
            
            dayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dayView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            dayView.heightAnchor.constraint(equalToConstant: 341),
            dayView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 155),
            
            nightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nightView.heightAnchor.constraint(equalToConstant: 341),
            nightView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            nightView.topAnchor.constraint(equalTo: dayView.bottomAnchor, constant: 12),
            nightView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    
        ])
    }
}
