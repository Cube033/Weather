//
//  CityControllerHours.swift
//  Weather
//
//  Created by Дмитрий Федотов on 16.12.2022.
//

import UIKit

class CityControllerHours: UIView {

    //MARK: - Variables
    
    var dayHoursIconModel: DayHoursIconModel?
    
    var model: DayHoursIconModel {
        get {
            return dayHoursIconModel ?? DayHoursIconModel.getEmptyModel()
        }
    }
    
    let goToHoursButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .yellow
        let attributedString = NSAttributedString(string: NSLocalizedString("Подробнее на 24 часа", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "Rubik-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1),
            NSAttributedString.Key.underlineStyle:1.0
        ])
        view.setAttributedTitle(attributedString, for: .normal)
        return view
    }()
    
    private lazy var hoursColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = .systemGray5
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HoursCollectionViewCell.self, forCellWithReuseIdentifier: "HoursCollectionViewCell")
        return collectionView
    }()
     
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(dayHoursIconModel: DayHoursIconModel) {
        self.init(frame: .zero)
        self.dayHoursIconModel = dayHoursIconModel
        self.setupView()
    }
    
    
    //MARK: - Functions
    
    private func setupView() {
        backgroundColor = .white
        
        addElements()
    }
    
    private func addElements() {
        
        addSubview(goToHoursButton)
        addSubview(hoursColletionView)
        
        setConstraints()
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            goToHoursButton.widthAnchor.constraint(equalToConstant: 180),
            goToHoursButton.heightAnchor.constraint(equalToConstant: 20),
            goToHoursButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            goToHoursButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 33),
            
            hoursColletionView.topAnchor.constraint(equalTo: goToHoursButton.bottomAnchor, constant: 24),
            hoursColletionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hoursColletionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hoursColletionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}

//MARK: - Extensions

extension CityControllerHours: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.hoursArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hoursCell = hoursColletionView.dequeueReusableCell(withReuseIdentifier: "HoursCollectionViewCell", for: indexPath) as! HoursCollectionViewCell
        hoursCell.setupCell(hourIconModel: model.hoursArray[indexPath.row])
        return hoursCell
    }
    
    
}

extension CityControllerHours: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width
        let sideWidth = (screenWidth - sideInset * 7) / 6
        let sideHeight:Double = 84
        return CGSize(width: sideWidth, height: sideHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
}
