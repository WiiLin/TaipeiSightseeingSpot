//
//  WLMainCollectionViewCell.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLMainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: WLLoadingImageView!
    
    override func awakeFromNib() {
        self.contentView.layer.borderColor = WLColor.appBlue.cgColor
        self.contentView.layer.borderWidth = 2.5
    }
}
