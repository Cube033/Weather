//
//  CityViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit

class CityViewController: UITableViewController {

    var cityDaysModel: CityDaysModel?
    
    var cityData: CityDataCodable
    
    var navController: UINavigationController
    
    lazy var cityControllerHeader = CityControllerHeader(dayMiniModel: DayMiniModel.getEmptyModel())
    
    let cityControllerHours = CityControllerHours(dayHoursIconModel: DayHoursIconModel.getEmptyModel())
    
    let cityControllerDaysHeader = CityControllerDaysHeader()
    
    var model: CityDaysModel {
        get {
            return cityDaysModel ?? CityDaysModel.getEmptyModel()
        }
    }
    
    init(navController: UINavigationController, cityData: CityDataCodable){
        self.navController = navController
        self.cityData = cityData
        //self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }
    
    private func setView() {
       // view.backgroundColor = .purple
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(CityControllerDayCell.self, forCellReuseIdentifier: "CityControllerDayCell")
        cityControllerHours.goToHoursButton.addAction(UIAction { _ in
            print("go to hours")
            self.navController.pushViewController(HoursViewController(navController: self.navController), animated: true)
//            self.navigationController?.pushViewController(HoursViewController(), animated: true)
//            if let navControllerExist = self.navController {
//                navControllerExist.pushViewController(HoursViewController(), animated: true)
//            } else {
//                print("nav controller is empty")
//            }
        }, for: .touchUpInside)
        
        setupWeather()
    }
    
    private func setupWeather() {
        NetworkManager.shared.getCurrentWeather(cityData: cityData, completion:
                                                {(currentWeatherOptional) in
            if let currentWeather = currentWeatherOptional {
                DispatchQueue.main.async {
                    //self.cityControllerHeader = CityControllerHeader(dayMiniModel: )
                    self.cityControllerHeader.setupModelData(model: DayMiniModel.getModelByCurrentWeather(currentWeather: currentWeather))
                }
            } else {
                DispatchQueue.main.async {
                    CityNamePicker.setAlert(showIn: self, textMessage: "Произошла ошибка")
                }
            }
        })
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityControllerDayCell", for: indexPath) as! CityControllerDayCell
        cell.setupCell(model: model.daysArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return model.daysArray.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navController.pushViewController(AllDayViewController(), animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return cityControllerHeader
        } else if section == 1 {
            return cityControllerHours
        } else if section == 2 {
            return cityControllerDaysHeader
        } else {
            return UIView()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 190
        } else if section == 1 {
            return 170
        } else {
            return 25
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
