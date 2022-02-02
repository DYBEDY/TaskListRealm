//
//  DataManager.swift
//  TaskListRealm
//
//  Created by Roman on 02.02.2022.
//

import Foundation


class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempDataV2(completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "testBase") {
            
            let shoppingList = TaskList()
            shoppingList.name = "Поход в магазин"
            
            let milk = Task()
            milk.name = "Молоко"
            milk.note = "2 л"
            
            let bananas = Task()
            bananas.name = "Бананы"
            bananas.note = "5 кг"
            
            let fish = Task()
            fish.name = "Рыба"
            fish.note = "свежая"
            
            

            shoppingList.tasks.insert(contentsOf: [milk,bananas, fish], at: 0)
          
            
            DispatchQueue.main.async {
                StorageManager.shared.save([shoppingList])
                UserDefaults.standard.set(true, forKey: "testBase")
                completion()
            }
        }
    }
}

