//
//  MBRecommendViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/31.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBRecommendViewController: UIViewController {

    //数据源
    private var dataArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor ( red: 0.9939, green: 0.8529, blue: 0.9998, alpha: 1.0 )
        
        //创建导航条
        createNav()
        //显示图片按钮
        showCollectData()
    }
    func createNav(){
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        self.navigationItem.title = "精品推荐"
    }
    func showCollectData(){
        let imageView = UIImageView(image: UIImage(named: "menu_pic_plate2_2x"))
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
