//
//  WLMainViewController.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/18.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLMainViewController: UIViewController {
    @IBOutlet weak var footerIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var refreshButton: UIButton!
    var dataSource : [WLSightseeingSpot] = []
    var loadingData : Bool = false
    var offset : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadData()
        // Do any additional setup after loading the view.
    }
    func loadData(){
        guard false == self.loadingData else{
            return
        }
        print("loadData")
        self.footerIndicator.startAnimating()
        self.refreshButton.isHidden = true
        self.loadingData = true
        WLAPIService.shared.getSightseeingSpotList(offset:offset,
                                                   success: { (sightseeingSpotList) in
                                                    self.footerIndicator.stopAnimating()
                                                    self.loadingData = false
                                                    self.offset += 1
                                                    self.dataSource += sightseeingSpotList
                                                    self.tableView.reloadData()
                                                    
        }) { (error) in
            self.refreshButton.isHidden = false
            self.footerIndicator.stopAnimating()
            self.loadingData = false
            self.alertError(error: error, action:nil)
        }
    }
    
    @IBAction func onClickRefresh(_ sender: Any) {
        self.loadData()
    }
}

extension WLMainViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WLMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WLMainTableViewCell", for: indexPath) as! WLMainTableViewCell
        cell.setup(sightseeingSpot: self.dataSource[indexPath.section],didSelectImageClosure: { (imageURL,image) in
            self.present(WLSpotPreviewViewController.spotPreviewViewController(imageURL: imageURL, image: image), animated: true, completion: nil)
        })
        return cell
    }
    
    
}
extension WLMainViewController : UITableViewDelegate{
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastElement = self.dataSource.count - 1
//        if indexPath.section == lastElement {
//            self.loadData()
//        }
//    }
    
}
extension WLMainViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height){
             self.loadData()
        }
    }
    
}
