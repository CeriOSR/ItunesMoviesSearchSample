//
//  ArrayHelper++.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 05/01/2019.
//  Copyright © 2019 Rey Cerio. All rights reserved.
//

import Foundation

/// Chunks the array for pagination purpose
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
