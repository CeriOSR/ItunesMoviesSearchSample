//
//  LastVisitDateModel.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 25/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation

class LastVisitDate {
    
    static let sharedInstance = LastVisitDate()
    
    func getDateFromUserDefaults(completion: @escaping (String) -> ()) {
        let defaults = UserDefaults.standard
        if let stringDate = defaults.string(forKey: defaultsKeys.keyOne) {
            completion(stringDate)
        }
    }
    
    func setDateIntoUserDefaults() {
        let stringDate = String(describing: Date())
        let defaults = UserDefaults.standard
        defaults.set(stringDate, forKey: defaultsKeys.keyOne)
    }
}
