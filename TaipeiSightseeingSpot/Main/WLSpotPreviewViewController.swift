//
//  WLSpotPreviewViewController.swift
//  TaipeiSightseeingSpot
//
//  Created by Wii Lin on 2018/7/19.
//  Copyright © 2018年 Wii Lin. All rights reserved.
//

import UIKit

class WLSpotPreviewViewController: UIViewController {
    
    var imageURL : String!
    var image : UIImage?
    @IBOutlet weak var imageView: WLLoadingImageView!
    
    class func spotPreviewViewController(imageURL:String, image : UIImage?) -> WLSpotPreviewViewController {
        let vc = (UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WLSpotPreviewVC") as! WLSpotPreviewViewController)
        vc.modalPresentationStyle   = .overCurrentContext
        vc.modalTransitionStyle     = .crossDissolve
        vc.imageURL = imageURL
        vc.image = image
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = self.image{
            self.imageView.image = image
        }
        else{
            self.imageView.setup(url: self.imageURL)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
