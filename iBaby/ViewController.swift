//
//  ViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import JKCategories

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航条的背景颜色
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        //设置不让系统自动控制scrollView的contentInset属性
        self.automaticallyAdjustsScrollViewInsets = false
        //封装返回按钮
        self.configureBackItme()
    }
    func configureBackItme(){
        //如果是push出的控制器，那么返回按钮响应的是pop，否则是dismiss
        if (self.navigationController?.presentingViewController == nil && self.navigationController?.viewControllers.first != self || self.navigationController?.presentingViewController != nil){
            
            let backBtn = UIButton.createBtn(CGRectMake(0, 0, 50, 40), title: nil, bgImageName: "mine_btn_back_normal_iphone")
            backBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside, withBlock: { (sender) in
                //判断如果pop不成功，就将导航控制器隐藏
                if self.navigationController?.popViewControllerAnimated(true) == nil{
                    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                }
            })
            let backItme = UIBarButtonItem.init(customView: backBtn)
            self.navigationItem.leftBarButtonItem = backItme
        }
        //只有不是present出的导航控制器的第二个控制器，需要添加这个属性
        if self.navigationController?.presentingViewController == nil && self.navigationController?.viewControllers.count >= 2 && self.navigationController?.viewControllers[1] == self{
            self.hidesBottomBarWhenPushed = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// 封装一个分类，方便获取 tabBar、navigationBar、statusBar 等的高度
extension UIViewController {
    var statusBarHeight : CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.size.height
    }
    
    var naviBarHeight : CGFloat {
        return (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    var tabBarHeight : CGFloat {
        if self.tabBarController != nil
            && self.navigationController?.viewControllers.first == self
        {
            return (self.tabBarController?.tabBar.frame.size.height)!
        }else {
            return 0
        }
    }
    
    var topBarHeight : CGFloat {
        if self.navigationController != nil {
            return statusBarHeight + naviBarHeight
        }else {
            return 0
        }
    }
    
}





