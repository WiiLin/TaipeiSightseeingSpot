//
//  WLLoadingImageView.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLLoadingImageView: UIImageView {
    var activityIndicatorView : UIActivityIndicatorView!
    override func awakeFromNib() {
        self.activityIndicatorView = UIActivityIndicatorView.init()
        self.activityIndicatorView.color = WLColor.appBlue
        self.activityIndicatorView.hidesWhenStopped = true
        self.addSubview(self.activityIndicatorView)
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     self.activityIndicatorView.heightAnchor.constraint(equalToConstant: 50),
                                     self.activityIndicatorView.widthAnchor.constraint(equalToConstant: 50)])
        
    }
    func setup(url : String){
        self.activityIndicatorView.startAnimating()
        self.setImage(url: url, completion: {
            self.activityIndicatorView.stopAnimating()
        })
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
