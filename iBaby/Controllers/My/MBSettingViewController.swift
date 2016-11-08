//
//  MBSettingViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/7.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createNav()

    }
    func createNav(){
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        self.navigationItem.title = "系统设置"
    }
    func createView(){
        
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
