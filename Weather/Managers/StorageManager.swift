//
//  StorageManager.swift
//  Weather
//
//  Created by Дмитрий Федотов on 13.12.2022.
//

import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    func getCities() -> [DBCities] {
        
        return dbCities
        //return ["Kemerowo","Tomsk","Berlin"]
    }
    
//    func addNewCity(cityData: CityDataCodable) {
//        print("Добавлен город \(cityData.name)")
//    }
    
    enum CoreDataActionResult {
        case success(String)
        case failure(String)
    }
    
    var dbCities: [DBCities] = []
    
    lazy var contextMain: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return context
    }()

    lazy var contextBackground: NSManagedObjectContext = {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return context
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer (name: "Weather")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init() {
        fetchCities()
    }
    
    private func saveContext (isMainContext: Bool) {
        let context = isMainContext ? contextMain : contextBackground
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchCities(){
        let request = DBCities.fetchRequest()
        do {
            let dbCities = try contextMain.fetch(request)
            self.dbCities = dbCities
        } catch {
            self.dbCities = []
        }
    }
    
    func addNewCity(cityData: CityDataCodable) -> CoreDataActionResult{
        
        if !isCitySaved(cityName: cityData.name) {
            let dbCity = DBCities(context: contextBackground)
            dbCity.cityName = cityData.name
            dbCity.cityLabel = cityData.localNames.ru
            dbCity.latitude = cityData.lat
            dbCity.longitude = cityData.lon
            
            saveContext(isMainContext: false)
            fetchCities()
            return .success("Город \(dbCity.cityLabel ?? "")  добавлен")
        } else {
            return .failure("Ошибка добавления города")
        }
    }
    
    func deleteCity(dbCity: DBCities) {
        contextMain.delete(dbCity)
//        contextBackground.delete(dbPost)
        saveContext(isMainContext: true)
        fetchCities()
    }
    
    func isCitySaved(cityName: String) -> Bool {
        let citiesArray = getCityByName(cityName: cityName)
        return citiesArray.count > 0
    }
    
    func getCityByName(cityName: String) -> [DBCities] {
        let request = DBCities.fetchRequest()
        request.predicate = NSPredicate(format: "cityName LIKE %@", cityName)
        do {
            let dbCities = try contextMain.fetch(request)
            return dbCities
        } catch {
            return []
        }
    }
    
}
