//
//  MBTabBarController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       configureViewController()
        
    }
    //封装一个标签栏视图控制器组
    func configureViewController(){
        
        let vcInfos = [
            [
                "image":"心",
                "title":"宝妈",
                "class":"iBaby.MBMainPageViewController"
            ],
            [
                "image":"笔记本",
                "title":"计划",
                "class":"iBaby.MBCourseViewController"
            ],
            [
                "image":"钱",
                "title":"福利",
                "class":"iBaby.MBWelfareViewController"
            ],
            [
                "image":"小孩",
                "title":"咱的",
                "class":"iBaby.MBMyInfoViewController"
            ]
            
        ]
        var vcArray : [UINavigationController] = []
        for vcInfo in vcInfos{
            let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
            vc.title = vcInfo["title"]
            let navVC = UINavigationController(rootViewController: vc)
            navVC.navigationItem.titleView?.tintColor = UIColor.whiteColor()
            vcArray.append(navVC)
        }
        //加到tabBar的视图控制器组里
        self.viewControllers = vcArray
        var i = 0
        for tabBarItem in self.tabBar.items!{
            tabBarItem.image = UIImage.init(named: vcInfos[i]["image"]!)
            i += 1
        }
        //设置选中状态下tabBar的颜色
        self.tabBar.tintColor = UIColor ( red: 1.0, green: 0.4353, blue: 0.8118, alpha: 1.0 )
        
        self.tabBar.barTintColor = UIColor ( red: 0.2873, green: 0.2508, blue: 0.3573, alpha: 1.0 )
        
    }

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
