//
//  MBDetailViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/31.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBDetailViewController: UIViewController {

    //分段选择器下标
    var selectIndex: Int = 0
    
    var leftVC = MBMmInfoView()
    var rightVC = MBBbInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        //导航
        self.createNav()
    }
    func createNav(){
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        let segmentCtrl = UISegmentedControl(items: ["家长信息","宝宝信息"])
        //修改文字颜色
        segmentCtrl.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor()], forState: .Normal)
        let backImage = UIImage.jk_imageWithColor(UIColor.lightGrayColor()).jk_resizedImage(CGSizeMake(300, 30), interpolationQuality: CGInterpolationQuality.High)
        segmentCtrl.setBackgroundImage(backImage, forState: .Normal, barMetrics: UIBarMetrics.Default)
        segmentCtrl.clipsToBounds = true
        segmentCtrl.selectedSegmentIndex = 0
        segmentCtrl.addTarget(self, action: #selector(clickSegmentCtrl(_:)), forControlEvents: .ValueChanged)
        segmentCtrl.selectedSegmentIndex = self.selectIndex
        self.navigationItem.titleView = segmentCtrl
        
        self.addChildViewController(self.leftVC)
        self.view.addSubview(self.leftVC.view)
        self.leftVC.didMoveToParentViewController(self)
        
        let backBtn = UIButton(type: .Custom)
        let barBtn = UIBarButtonItem(customView: backBtn)
        self.navigationItem.backBarButtonItem = barBtn
        backBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
        
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    func clickSegmentCtrl(segmentCtrl:UISegmentedControl){
       // showPage(segmentCtrl.selectedSegmentIndex)
        if self.selectIndex == 0 && segmentCtrl.selectedSegmentIndex == 1 {
            
            self.leftVC.view.removeFromSuperview()
            self.leftVC.removeFromParentViewController()
            self.leftVC.didMoveToParentViewController(nil)
            
            self.addChildViewController(self.rightVC)
            self.view.addSubview(self.rightVC.view)
            self.rightVC.didMoveToParentViewController(self)
            
        }else if self.selectIndex == 1 && segmentCtrl.selectedSegmentIndex == 0 {
            
            self.rightVC.view.removeFromSuperview()
            self.rightVC.removeFromParentViewController()
            self.rightVC.didMoveToParentViewController(nil)
            
            self.addChildViewController(self.leftVC)
            self.view.addSubview(self.leftVC.view)
            self.leftVC.didMoveToParentViewController(self)
            
        }
        self.selectIndex = segmentCtrl.selectedSegmentIndex
        
    }
//    func showPage(index: Int){
//        if self.selectIndex == 0 && index == 1 {
//            
//            self.leftVC.view.removeFromSuperview()
//            self.leftVC.removeFromParentViewController()
//            self.leftVC.didMoveToParentViewController(nil)
//            
//            self.addChildViewController(self.rightVC)
//            self.view.addSubview(self.rightVC.view)
//            self.rightVC.didMoveToParentViewController(self)
//            
//        }else if self.selectIndex == 1 && index == 0 {
//            
//            self.rightVC.view.removeFromSuperview()
//            self.rightVC.removeFromParentViewController()
//            self.rightVC.didMoveToParentViewController(nil)
//            
//            self.addChildViewController(self.leftVC)
//            self.view.addSubview(self.leftVC.view)
//            self.leftVC.didMoveToParentViewController(self)
//            
//        }
//
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
