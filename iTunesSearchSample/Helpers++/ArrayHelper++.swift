//
//  ArrayHelper++.swift
//  iTunesSearchSample
//
//  Created by Mei on 2018-12-23.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation

//chunks the array for pagination purpose
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
