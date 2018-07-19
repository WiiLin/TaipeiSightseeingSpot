//
//  WLImageCache.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLImageCache: NSCache<NSString, UIImage> {
    static let shared : WLImageCache = WLImageCache()
    
    func cacheImage(image:UIImage, key:String){
        self.setObject(image, forKey: key as NSString)
    }

    func image(key : String) -> UIImage?{
        return self.object(forKey: key as NSString)
    }
}
