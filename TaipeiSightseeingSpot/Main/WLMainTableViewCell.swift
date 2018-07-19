//
//  WLMainTableViewCell.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBootomLayoutConstraint: NSLayoutConstraint!
    private var sightseeingSpot : WLSightseeingSpot!
    private var didSelectImageClosure : ((String,UIImage?)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource  = self
        self.collectionView.delegate    = self
    
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(sightseeingSpot : WLSightseeingSpot,didSelectImageClosure : ((String,UIImage?)->())?) {
        self.didSelectImageClosure = didSelectImageClosure
        self.sightseeingSpot    = sightseeingSpot
        self.titleLabel.text    = sightseeingSpot.stitle
        self.bodyLabel.text     = sightseeingSpot.xbody
        if 0 == self.sightseeingSpot.files().count {
            self.collectionViewHeightLayoutConstraint.constant = 0
            self.collectionViewBootomLayoutConstraint.constant = 0
        }
        else{
            self.collectionViewHeightLayoutConstraint.constant = 115
            self.collectionViewBootomLayoutConstraint.constant = 30
        }
        self.collectionView.reloadData()
    }
    
}
extension WLMainTableViewCell : UICollectionViewDelegateFlowLayout {
    
}
extension WLMainTableViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectImageClosure?(self.sightseeingSpot.files()[indexPath.row],(collectionView.cellForItem(at: indexPath) as? WLMainCollectionViewCell)?.imageView.image)
    }
}
extension WLMainTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sightseeingSpot.files().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WLMainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WLMainCollectionViewCell", for: indexPath) as! WLMainCollectionViewCell
        cell.imageView.setup(url: self.sightseeingSpot.files()[indexPath.row])
        return cell
    }
    
    
}


