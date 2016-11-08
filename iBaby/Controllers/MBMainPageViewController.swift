//
//  MBMainPageViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
import Alamofire
/*
 tabBar---one
 */
class MBMainPageViewController:MBTableViewController {

    //首页数据
    lazy var dataArray = NSArray()
    //广告的数据
    lazy var adArray = NSArray()
    //列表的数据
    lazy var listArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        //导航的封装
        createNav()
        
        self.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        //下载数据
        downloadData()
    }
    //导航条的封装
    func createNav(){
        let title = UILabel.createLabel(CGRectMake(-50, 0, 80, 20), text: "今日推荐", textAlignment: .Center)
        title.font = UIFont.systemFontOfSize(17)
        title.textColor = UIColor.whiteColor()
        let titleView = UIView(frame: CGRectMake(-50,0,80,20))
        self.navigationItem.titleView = titleView
        titleView.addSubview(title)
        
        let emailBtn = UIButton.createBtn(CGRectMake(0, 0, 50, 40), title: nil, bgImageName: "menu_btn_message_normal_2x")
        let emailBarBtn = UIBarButtonItem(customView: emailBtn)
        self.navigationItem.rightBarButtonItem = emailBarBtn
        emailBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(MBMessageViewController(), animated: true)
        }

        let blankBtn = UIButton(type: .Custom)
        blankBtn.backgroundColor = UIColor.whiteColor()
        let blankBarBtn = UIBarButtonItem(customView: blankBtn)
        //courseTitle
        let blankLabel = UILabel()
        blankLabel.textColor = UIColor.orangeColor()
        blankLabel.text = "开课！"
        blankLabel.numberOfLines = 0
        blankLabel.font = UIFont.systemFontOfSize(13)
        blankLabel.backgroundColor = UIColor.clearColor()
        blankBtn.addSubview(blankLabel)
        self.navigationItem.leftBarButtonItem = blankBarBtn
        blankLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.width.height.equalTo(50)
            make.left.equalTo(10)
        }
        blankBtn.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.width.height.equalTo(50)
        }
        blankBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            let bgView = UIView()
            bgView.frame = UIScreen.mainScreen().bounds
            bgView.backgroundColor = UIColor ( red: 0.298, green: 0.298, blue: 0.298, alpha: 0.6 )
            self.view.addSubview(bgView)
            //展示白框
            let whiteView = UIView()
            whiteView.backgroundColor = UIColor.whiteColor()
            bgView.addSubview(whiteView)
            whiteView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(64)
                make.width.equalTo(320)
                make.height.equalTo(100)
            })
            //白框内的数据
            let nameArray = ["周一\n百科","周二\n右脑","周三\n数学","周四\n实验","周五\n综合","周末\n右脑"]
            //循环创建按钮
            let w: CGFloat = 107
            let h: CGFloat = 50
            for i in 0..<nameArray.count {
                //行
                let row = i/3
                let col = i%3
                let frame = CGRectMake(CGFloat(col)*w,CGFloat(row)*h, 107, 50)
                let btn = UIButton.createBtn(frame, title: nil, bgImageName: nil)
                btn.setTitle(nameArray[i], forState: .Normal)
                btn.backgroundColor = UIColor.whiteColor()
                btn.titleLabel?.font = UIFont.systemFontOfSize(13)
                btn.setTitleColor(UIColor ( red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0 ), forState: .Normal)
                btn.titleLabel?.numberOfLines = 0
                btn.titleLabel?.textAlignment = .Center
                btn.tag = 300+i
                whiteView.addSubview(btn)
                btn.jk_handleControlEvents(.TouchUpInside, withBlock: { (sender) in
                    //改变blankLabel的值
                    blankLabel.text = btn.titleLabel?.text
                    btn.setTitleColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ), forState: .Normal)
                    bgView.removeFromSuperview()
                })
             }
          }
    }
    //下载数据
    func downloadData(){
        dispatch_async(dispatch_get_global_queue(0, 0)){
          
            //取出json的数据(广告)
            let cellData = NSData.init(contentsOfFile: NSBundle.mainBundle().pathForResource("adData.json", ofType: nil)!)
            let cellInfo = try!NSJSONSerialization.JSONObjectWithData(cellData!, options: NSJSONReadingOptions.MutableContainers)
            
            self.adArray = NSArray.modelArrayWithClass(ADModel.self, json: (cellInfo as! NSDictionary)["list"]!)!
            
            //列表
            let listData = NSData.init(contentsOfFile: NSBundle.mainBundle().pathForResource("Home_tow&threePic.json", ofType: nil)!)
            let listInfo = try! NSJSONSerialization.JSONObjectWithData(listData!, options:NSJSONReadingOptions.MutableContainers)
            self.listArray = NSArray.modelArrayWithClass(ListModel.self, json: (listInfo as! NSDictionary)["list"]!)!
            
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
            
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
//MARK:UITableView的代理
extension MBMainPageViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = self.dataArray.count
        if self.adArray.count > 0  && self.listArray.count > 0{
            num += 5
        }
        return num
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var h: CGFloat = 0
        if self.adArray.count > 0{
            if indexPath.row == 0{
                h = 120
            }else if indexPath.row == 1{
                h = 80
            }else{
                h = 155
            }
        }else{
            h = 155
        }
        return h
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.adArray.count > 0{
            if indexPath.row == 0{
                //广告
                let cellId = "adCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ADCell
                if cell == nil{
                    cell = NSBundle.mainBundle().loadNibNamed("ADCell", owner: nil, options: nil).last as? ADCell
                }
                cell?.configureWith(adArray)
                return cell!
               
            }else if indexPath.row == 1{
                let cellId = "apCellId"
                var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? APCell
                if cell == nil{
                    cell = NSBundle.mainBundle().loadNibNamed("APCell", owner: nil, options: nil).last as? APCell
                }
                return cell!
            }
        }
        //列表数据
        let cellId = "homeCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HomeCell
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed("HomeCell", owner: nil, options: nil).last as? HomeCell
        }
        let index = adArray.count > 0 ? indexPath.row - 2 : indexPath.row
        cell?.configureWith(listArray[index] as! ListModel)
        return cell!
        
      }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //育儿风向标之宝宝犯错了
        if indexPath.row == 3{
            let classCtl = MBClassViewController()
            classCtl.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(classCtl, animated: true)
        }
    }
}