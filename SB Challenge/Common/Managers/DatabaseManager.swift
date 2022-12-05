//
//  DatabaseManager.swift
//  SB Challenge
//
//  Created by George Kiplagat on 05/12/2022.
//

import RealmSwift

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let realm = try! Realm()
    
    // MARK: - Lifecycle
    
    private init() {}
    
    // MARK: - Work With Objects

    
    func delete(object: Object) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    // MARK: - Work With User Profile
    
    func replace(profile: UserDetailsModel) {
        
        let existingRecord = self.searchProfile(username: profile.login!)
        
        if (existingRecord.count > 0){
            try! realm.write {
                realm.delete(existingRecord)
            }
        }
    
        try! realm.write {
            realm.add(profile)
        }
    }
    
    func fetchSearchHistory() -> [UserDetailsModel] {
        return Array(realm.objects(UserDetailsModel.self))
    }
    
    func searchProfile(username: String) -> [UserDetailsModel] {
        let predicate = NSPredicate(format: "login == %@", username)

        return Array(realm.objects(UserDetailsModel.self).filter(predicate))
    }

    func fetchProfile(username: String) -> UserDetailsModel {
        let predicate = NSPredicate(format: "login == %@", username)

        return Array(realm.objects(UserDetailsModel.self).filter(predicate))[0]
    }

}
