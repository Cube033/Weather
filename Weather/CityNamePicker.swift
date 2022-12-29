//
//  CityNamePicker.swift
//  Weather
//
//  Created by Дмитрий Федотов on 27.12.2022.
//

import Foundation
import UIKit


class CityNamePicker {
    
    func getCityName(showIn viewController: UIViewController, completion: ((_ text: String)->Void)?) {
        let alertController = UIAlertController(title: "Введите название города", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите текст"
        }
        
        let actionAdd = UIAlertAction(title: "Добавить", style: .default) { action in
            if let text = alertController.textFields?[0].text,
               text != "" {
                completion?(text)
            }
        }
        let actionCancel = UIAlertAction(title: "Отменить", style: .cancel)
        
        alertController.addAction(actionAdd)
        alertController.addAction(actionCancel)
        viewController.present(alertController, animated: true)
    }
    
    static func setAlert(showIn viewController: UIViewController, textMessage: String) {
        let alert = UIAlertController(title: "Внимание", message: textMessage, preferredStyle: .alert)
        let actionDismiss = UIAlertAction(title: "Закрыть", style: .default) { (_) -> Void in
            //            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(actionDismiss)
        viewController.present(alert, animated: true, completion: nil)
    }
}
