//
//  ImageDownloader.swift
//  iTunesSearchSample
//
//  Created by Rey Cerio on 22/12/2018.
//  Copyright © 2018 Rey Cerio. All rights reserved.
//

import Foundation
import AlamofireImage
import Alamofire

extension UIImageView {

    func imageDownloader(urlString: String) {
        
        Alamofire.request(urlString).responseImage { response in
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                let scaledImage = image.af_imageScaled(to: CGSize(width: ScreenSize.width, height: ScreenSize.height))
                self.image = scaledImage
            }
        }
    }
}
