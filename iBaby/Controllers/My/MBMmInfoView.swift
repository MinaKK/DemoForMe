//
//  MBMmInfoView.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/4.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBMmInfoView: MBTableViewController {

    var haderTitles : [String]?
    let cellInfos = [
    [
        [
            "title":"头像",
            "imageName":"set_pic_mamaface_def_2x",
            "subTtile":""
        ],
        [
            "title":"昵称",
            "imageName":"7202597",
            "subTitle":""

        ],
        [
            "title":"性别",
            "imageName":"妈妈",
            "subTitle":""
            
        ],
        [
            "title":"年龄",
            "imageName":"未知",
            "subTitle":""
            
        ],
        [
            "title":"所在地",
            "imageName":"",
            "subTitle":"未知"
            
        ],
    ],
    [
        [
            "title":"QQ绑定",
            "imageName":"mine_pic_qqicon_iphone",
            "subTitle":""
            
        ],
        [
            "title":"新浪微博",
            "imageName":"mine_pic_sinaicon_iphone",
            "subTitle":""
            
        ]
    ]
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor ( red: 0.9965, green: 0.8499, blue: 0.9081, alpha: 1.0 )
        self.tableView.registerClassOf(UITableViewCell)
        
        self.tableView.sectionHeaderHeight = 25
        self.haderTitles = ["基本信息","账号绑定"]
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
extension MBMmInfoView{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.cellInfos.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellInfos[section].count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return 70
        }else{
            return 50
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.haderTitles?[section]
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell()
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        cell.textLabel?.font = UIFont.systemFontOfSize(15)
        cell.textLabel?.textColor = UIColor.darkTextColor()
        cell.textLabel?.text = self.cellInfos[indexPath.section][indexPath.row]["title"]
        
        cell.detailTextLabel?.text = self.cellInfos[indexPath.section][indexPath.row]["subTitle"]
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(13)
        cell.detailTextLabel?.textColor = UIColor ( red: 1.0, green: 0.4, blue: 1.0, alpha: 1.0 )
        
        cell.imageView?.image = UIImage(named:self.cellInfos[indexPath.section][indexPath.row]["imageName"]!)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
