//
//  MBCourseViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/2.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBCourseViewController: UIViewController {

    let listBtn = UIButton(type: .Custom)
    let twoBtn = UIButton(type: .Custom)
    let fourBtn = UIButton(type: .Custom)
    let sixBtn = UIButton(type: .Custom)
    let titleBtn = UIButton(type: .Custom)
    let bgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        createNav()
        createView()
        
    }
    //导航条
    func createNav(){
        
        self.addChildViewController(MBPictureViewController())
        self.view.addSubview(MBPictureViewController().view)
        MBPictureViewController().didMoveToParentViewController(self)
        
        self.navigationController?.navigationBar.barTintColor = UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 )
        titleBtn.frame = CGRectMake(100, 10, 120, 20)
        titleBtn.setTitle("0-2岁课程<点我>", forState: .Normal)
        titleBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        titleBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        titleBtn.titleLabel?.textAlignment = .Center
        self.navigationItem.titleView = titleBtn
        titleBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            //先移除之前的视图
            self.view.removeAllSubviews()
            
            self.addChildViewController(MBPictureViewController())
            self.view.addSubview(MBPictureViewController().view)
            MBPictureViewController().didMoveToParentViewController(self)
            
            self.bgView.frame = UIScreen.mainScreen().bounds
            self.bgView.backgroundColor = UIColor ( red: 0.298, green: 0.298, blue: 0.298, alpha: 0.6 )
            self.view.addSubview(self.bgView)
            
            let whiteview = UIView()
            whiteview.backgroundColor = UIColor.whiteColor()
            self.bgView.addSubview(whiteview)
            whiteview.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(64)
                make.width.equalTo(self.bgView.snp_width)
                make.height.equalTo(100)
            })
        
            self.listBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: .Normal)
            self.listBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ), forState:.Highlighted)
            self.listBtn.setTitle("0-6岁宝宝课程总表", forState: .Normal)
            self.listBtn.titleLabel?.textAlignment = .Center
            self.listBtn.setTitleColor(UIColor ( red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0 ), forState: .Normal)
            whiteview.addSubview(self.listBtn)
            self.listBtn.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(0)
                make.width.equalTo(whiteview.snp_width)
                make.height.equalTo(40)
            })
            
            self.twoBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: .Normal)
            self.twoBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ), forState:.Highlighted)
            self.twoBtn.setTitle("0-2岁", forState: .Normal)
            self.twoBtn.titleLabel?.textAlignment = .Center
            self.twoBtn.setTitleColor(UIColor ( red: 0.8, green: 1.0, blue: 0.4, alpha: 1.0 ), forState: .Normal)
            self.twoBtn.setTitleColor(UIColor.orangeColor(), forState: .Selected)
            whiteview.addSubview(self.twoBtn)
            self.twoBtn.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(40)
                make.left.equalTo(0)
                make.width.equalTo(106)
                make.height.equalTo(60)
            })
            
            self.fourBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: .Normal)
            self.fourBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ), forState:.Highlighted)
            self.fourBtn.setTitle("2-4岁", forState: .Normal)
            self.fourBtn.titleLabel?.textAlignment = .Center
            self.fourBtn.setTitleColor(UIColor ( red: 1.0, green: 0.502, blue: 0.0, alpha: 1.0 ), forState: .Normal)
            self.fourBtn.setTitleColor(UIColor.orangeColor(), forState: .Selected)
            whiteview.addSubview(self.fourBtn)
            self.fourBtn.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(40)
                make.left.equalTo(107)
                make.width.equalTo(106)
                make.height.equalTo(60)
            })

            self.sixBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: .Normal)
            self.sixBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ), forState:.Highlighted)
            self.sixBtn.setTitle("4-6岁", forState: .Normal)
            self.sixBtn.titleLabel?.textAlignment = .Center
            self.sixBtn.setTitleColor(UIColor ( red: 0.4, green: 0.4, blue: 1.0, alpha: 1.0 )
                , forState: .Normal)
            self.sixBtn.setTitleColor(UIColor.orangeColor(), forState: .Selected)
            whiteview.addSubview(self.sixBtn)
            self.sixBtn.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(40)
                make.left.equalTo(213)
                make.width.equalTo(106)
                make.height.equalTo(60)
            })
            
        }
        let leftBtn = UIButton(type: .Custom)
        leftBtn.setImage(UIImage(named: "all_btn_suijidao_normal"), forState: .Normal)
        let leftBarBtn = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        leftBtn.snp_makeConstraints { (make) in
            make.top.equalTo(2)
            make.left.equalTo(10)
            make.width.height.equalTo(40)
        }
        leftBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            var subWindow = UIWindow.init(frame: UIScreen.mainScreen().bounds)
            subWindow = (UIApplication.sharedApplication().keyWindow)!
            subWindow.rootViewController = MBBabysViewController()
            subWindow.makeKeyAndVisible()

        }
        let rightBtn = UIButton(type: .Custom)
        rightBtn.setImage(UIImage(named: "menu_btn_download_highlight_ip4"), forState: .Normal)
        let rightBarBtn = UIBarButtonItem(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightBarBtn
        rightBtn.snp_makeConstraints { (make) in
            make.top.equalTo(2)
            make.left.equalTo(leftBtn.snp_right).offset(220)
            make.width.height.equalTo(40)
        }
        
    }
    func createView(){
        self.listBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
        self.navigationController?.pushViewController(MBLessonListViewController(), animated: true)
            MBLessonListViewController().hidesBottomBarWhenPushed = true
        }
        self.fourBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            self.titleBtn.setTitle("2-4岁课程<点我>", forState: .Normal)
            self.bgView.removeFromSuperview()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
