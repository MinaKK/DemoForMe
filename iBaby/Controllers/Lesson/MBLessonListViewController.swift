//
//  MBLessonListViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/5.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBLessonListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "0-6岁宝宝课程表"
        let imageView = UIImageView(image: UIImage(named: "left_bg_ip4"))
        self.view.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.right.equalTo(0)
            make.height.equalTo(self.view.bounds.size.height-64)
        }
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
