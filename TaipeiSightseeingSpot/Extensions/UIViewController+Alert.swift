//
//  UIViewController+Alert.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/19.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit


extension UIViewController{
    
    func alertError(error : NSError,
                    action : ((UIAlertAction) -> Swift.Void)?){
        let alert : UIAlertController = UIAlertController.init(title: "發生錯誤", message: error.localizedDescription, preferredStyle: .alert)
        let action : UIAlertAction = UIAlertAction.init(title: "確定", style: .default, handler: action)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
