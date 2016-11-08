//
//  MBMyInfoViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
/*
 tabBar---four
 */
public let MBImageArray = "imageArray"
public let MBTitleArray = "titleArray"
public let MBSubtitleArray = "subtitleArray"

class MBMyInfoViewController: MBTableViewController {

    //标题组
    var titleArray:NSArray?
    //数据源
    var dataArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        //封装导航条
        createNav()
        
        //封装数据源
        createDataArray()
        
        //设置tableView的contentInset属性，避免导航条遮挡住
        self.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
    }
    func createNav(){
        let idLable = UILabel.createLabel(CGRectMake(10, 0, 80, 20), text: "ID:7202597", textAlignment: .Center)
        idLable.font = UIFont.systemFontOfSize(12)
        let leftItme = UIBarButtonItem.init(customView:idLable)
        self.navigationItem.leftBarButtonItem = leftItme
        self.navigationItem.title = "咱的"
        let loginBtn = UIButton.createBtn(CGRectMake(0, 0, 40, 20), title: "登录", bgImageName: nil)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(12)
        let rightItme = UIBarButtonItem.init(customView: loginBtn)
        self.navigationItem.rightBarButtonItem = rightItme
        loginBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(MBLoginViewController(), animated: true)
        }
    }
    func createDataArray(){
        var dict1 = Dictionary<String,AnyObject>()
        dict1[MBImageArray] = ["set_pic_mamaface_def_2x"]
        dict1[MBTitleArray] = ["7202597"]
        dict1[MBSubtitleArray] = ["LV1新手妈妈"]
        self.dataArray.addObject(dict1)
        
        var dict2 = Dictionary<String,AnyObject>()
        dict2[MBImageArray] = ["mine_pic_fav_iphone"]
        dict2[MBTitleArray] = ["我的收藏"]
        dict2[MBSubtitleArray] = [""]
        self.dataArray.addObject(dict2)
        
        var dict3 = Dictionary<String,AnyObject>()
        dict3[MBImageArray] = ["mine_pic_coin_iphone","mine_pic_exchangevip_iphone","mine_pic_qgg_iphone"]
        dict3[MBTitleArray] = ["获取金币","兑换入口","去除广告"]
        dict3[MBSubtitleArray] = ["30(我的金币)","",""]
        self.dataArray.addObject(dict3)
        
        var dict4 = Dictionary<String,AnyObject>()
        dict4[MBImageArray] = ["mine_pic_set_iphone","mine_pic_com_iphone","mine_pic_help_iphone","mine_pic_about_iphone"]
        dict4[MBTitleArray] = ["系统设置","意见反馈","使用帮助","关于我们"]
        dict4[MBSubtitleArray] = ["目前版本:3.9.1","","",""]
        self.dataArray.addObject(dict4)
        
        var dict5 = Dictionary<String,AnyObject>()
        dict5[MBImageArray] = ["mine_pic_goodapp_iphone"]
        dict5[MBTitleArray] = ["精彩推荐"]
        dict5[MBSubtitleArray] = ["早教好帮手尽在这里"]
        self.dataArray.addObject(dict5)

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
//MARK:UITableView代理
extension MBMyInfoViewController{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dict = self.dataArray[section] as! Dictionary<String,AnyObject>
        let titleArray = dict[MBTitleArray] as! Array<String>
        return titleArray.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        var style : UITableViewCellStyle = .Subtitle
        ///注意:设置副标题的风格时，默认是Default，只要设置需要的Value值即可
        if (indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4){
            style = .Value1
        }
        if (cell == nil){
            cell = UITableViewCell(style: style, reuseIdentifier: cellId)
        }
        let dict = self.dataArray[indexPath.section] as! Dictionary<String,AnyObject>
        //标题
        let titleArray = dict[MBTitleArray] as! Array<String>
        cell?.textLabel?.text = titleArray[indexPath.row]
        //图片
        if dict.keys.contains(MBImageArray){
            let imageArray = dict[MBImageArray] as! Array<String>
            let imageName = imageArray[indexPath.row]
            cell?.imageView?.image = UIImage(named: imageName)
        }else{
            cell?.imageView?.image = nil
        }
        //副标题
        if dict.keys.contains(MBSubtitleArray){
            let subtitleArray = dict[MBSubtitleArray] as! Array<String>
            if indexPath.section == 2 && indexPath.row == 0{
                cell?.detailTextLabel?.textColor = UIColor.orangeColor()
            }else {
                cell?.detailTextLabel?.textColor = UIColor.lightGrayColor()
            }
            cell?.detailTextLabel?.font = UIFont.systemFontOfSize(12)
            cell!.detailTextLabel!.text = subtitleArray[indexPath.row]
        }else{
            cell!.detailTextLabel?.text = nil
        }
        cell!.accessoryType = .DisclosureIndicator
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 0{
            let detailVC = MBDetailViewController()
            detailVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 0{
            
        }
        if indexPath.section == 3 && indexPath.row == 0{
            let settingCtl = MBSettingViewController()
            settingCtl.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(settingCtl, animated: true)
        }
        if indexPath.section == 4 && indexPath.row == 0{
            let recommendCtl = MBRecommendViewController()
            recommendCtl.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(recommendCtl, animated: true)
        }
    }
    
}