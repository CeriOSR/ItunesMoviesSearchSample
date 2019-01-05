//
//  LastVisitDateModel.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 25/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation

class LastTrackVisited {
    
    static let sharedInstance = LastTrackVisited()
    
    func getTrackFromUserDefaults(completion: @escaping (String, Int) -> ()) {
        let defaults = UserDefaults.standard
        var title = String()
        if let trackTitle = defaults.string(forKey: defaultsKeys.keyOne) {
            title = trackTitle
        }
        let trackIndex = defaults.integer(forKey: defaultsKeys.keyTwo)
        completion(title, trackIndex)
        
    }
    
    func setTrackIntoUserDefaults(trackTitle: String, trackIndex: Int) {
        let defaults = UserDefaults.standard
        defaults.set(trackTitle, forKey: defaultsKeys.keyOne)
        defaults.set(trackIndex, forKey: defaultsKeys.keyTwo)
    }
}
