//
//  HoursViewController.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import UIKit
import Charts

class HoursViewController: UITableViewController {

    var cityDaysModel: CityDaysModel?
    
    var navController: UINavigationController
    
    let cityControllerHeader = CityControllerHeader(dayMiniModel: DayMiniModel.getEmptyModel())
    
    let cityControllerHours = CityControllerHours(dayHoursIconModel: DayHoursIconModel.getEmptyModel())
    
    let cityControllerDaysHeader = CityControllerDaysHeader()
    
    var model: CityDaysModel {
        get {
            return cityDaysModel ?? CityDaysModel.getEmptyModel()
        }
    }
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = UIFont(name: "Rubik-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
        chartView.xAxis.setLabelCount(7, force: false)
        chartView.xAxis.axisLineColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        
        var entries = [ChartDataEntry]()
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x),
                                             y: Double.random(in: 0...10)
//                                          ,
//                                         icon: NSUIImage(named: "whiteDot")
                                         ))
        }
        
        
        let set = LineChartDataSet(entries: entries)
        set.mode = .cubicBezier
        set.setCircleColor(.white)
        set.setColor(UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1))
        set.fill = LinearGradientFill(gradient: .init(colorsSpace: nil, colors: [
            UIColor(red: 0.241, green: 0.412, blue: 0.863, alpha: 1).cgColor,
            UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1).cgColor,
            UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 0).cgColor
        ] as! CFArray, locations: [0, 0, 1])!)
        set.drawFilledEnabled = true
        let data = LineChartData(dataSet: set)
        data.setValueFont(UIFont(name: "Rubik-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14))
        
        chartView.data = data
        
        
        //chartView.layer.addSublayer(layer0)
        return chartView
    }()
    
    init(navController: UINavigationController){
        self.navController = navController
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
        tableView.register(HoursControllerCell.self, forCellReuseIdentifier: "HoursControllerCell")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoursControllerCell", for: indexPath) as! HoursControllerCell
        cell.setupCell(model: DayMiniModel.getEmptyModel())
        //cell.setupCell(model: model.daysArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 2 {
//            return model.daysArray.count
//        } else {
            return 3
//        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return lineChartView
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
        1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}


