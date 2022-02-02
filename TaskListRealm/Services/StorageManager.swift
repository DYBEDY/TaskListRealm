//
//  StorageManager.swift
//  TaskListRealm
//
//  Created by Roman on 02.02.2022.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    
    //MARK: - TaskList
    
    func save(_ taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
    
    
}
