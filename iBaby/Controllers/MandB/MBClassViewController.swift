//
//  MBClassViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/4.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
 //育儿风向标之宝宝犯错了
class MBClassViewController: MBTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func createNav(){
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        let title = UILabel()
        title.text = "育儿风向标"
        title.font = UIFont.systemFontOfSize(15)
        title.textColor = UIColor.whiteColor()
        title.textAlignment = .Center
        self.navigationItem.titleView = title
        
        let shareBtn = UIButton(type: .Custom)
        shareBtn.setBackgroundImage(UIImage(named: "share"), forState: .Normal)
        let starBtn = UIButton(type: .Custom)
        starBtn.setBackgroundImage(UIImage(named: "star"), forState: .Normal)
        starBtn.setBackgroundImage(UIImage(named: "star-3"), forState: .Selected)
        let rightBtn1 = UIBarButtonItem(customView: shareBtn)
        let rightBtn2 = UIBarButtonItem(customView: starBtn)
        self.navigationItem.rightBarButtonItems = [rightBtn1,rightBtn2]
    }
    
}

