//
//  UIImageView+Download.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

private var sessionDataTask_property = 0
extension UIImageView {
    private var sessionDataTask: URLSessionDataTask? {
        get{
            return objc_getAssociatedObject(self, &sessionDataTask_property) as? URLSessionDataTask
        }
        set{
            objc_setAssociatedObject(self, &sessionDataTask_property, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    func setImage(url: String,completion:@escaping (()->Void)) {
        self.sessionDataTask?.cancel()
        self.sessionDataTask = nil
        if let image = WLImageCache.shared.image(key: url){
            self.image = image
            completion()
        }
        else{
            self.image = nil
            downloadImage(url: url,completion: completion)
        }
    }
    
    func downloadImage(url: String,completion:@escaping (()->Void)) {
        guard let URL = URL(string: url)  else {
            completion()
            return
        }
        self.sessionDataTask = URLSession.shared.dataTask(with: URL) { (data, response, error) in
            DispatchQueue.main.async {
                self.sessionDataTask = nil
                if let error = error{
                    guard false == (error as NSError?)?.isCancel else {
                        return
                    }
                }
                else{
                    if let data = data, let image = UIImage(data: data){
                        WLImageCache.shared.cacheImage(image: image, key: url)
                        self.image = image
                    }
                }
                completion()
            }
        }
        self.sessionDataTask?.resume()
    }
}


