//
//  NSError+Internet.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/19.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import Foundation


public extension NSError {
    public var isCancel : Bool{
        get{
            if NSURLErrorCancelled == self.code{
                return true
                
            }
            else{
                return false
            }
        }
    }
    public var isInternetError : Bool{
        get{
            if NSURLErrorNotConnectedToInternet == self.code ||
                NSURLErrorTimedOut == self.code{
                return true
                
            }
            else{
                return false
            }
        }
    }
}
