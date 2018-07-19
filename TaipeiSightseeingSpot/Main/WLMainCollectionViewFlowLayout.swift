//
//  WLMainCollectionViewFlowLayout.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLMainCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func awakeFromNib() {
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        self.scrollDirection = .horizontal
        self.itemSize = CGSize.init(width: 150, height: 115)
    }
}
