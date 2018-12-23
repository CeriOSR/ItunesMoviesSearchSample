//
//  FetchedObjects.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 21/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import Alamofire

class FetchObjectsFromUrl {
    
    static let sharedInstance = FetchObjectsFromUrl()
    
    /// fetching the json results from URL
    func fetchObject(completion: @escaping ([Track]) -> ()) {
        
        let url = "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie"
        var tracks = [Track]()
        Alamofire.request(url).responseJSON { (response) in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Results.self, from: data)
                    guard let resultTracks = results.results else {return}
                        for i in resultTracks {
                            let track = i
                            tracks.append(track)
//                            print(tracks.count)
                            completion(tracks)
                        }
                } catch let err {
                    print("Unable to decode json", err)
                }
            }
        }
    }
}


