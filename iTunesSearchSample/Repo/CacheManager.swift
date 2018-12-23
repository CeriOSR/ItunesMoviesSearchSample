//
//  CacheManager.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import RealmSwift

class CacheManager {
    private var database:Realm
    static let sharedInstance = CacheManager()
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> RealmSwift.Results<RealmTrack> {
        let results = database.objects(RealmTrack.self)
        return results
    }
    func addData(object: RealmTrack) {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    func deleteAllFromDatabase() {
        try! database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: RealmTrack) {
        try! database.write {
            database.delete(object)
        }
    }
}
