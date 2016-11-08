//
//  MBPictureViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/7.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBPictureViewController: MBTableViewController {
    //构造数据
    var cellInfos:[[String:String]] = []
    var cellModels:[AnyObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //准备数据
        prepareDataSource()
        
        let imageBtn = UIButton(type: .Custom)
        imageBtn.setBackgroundImage(UIImage(named: "lesson_banner"), forState: .Normal)
        self.view.addSubview(imageBtn)
        imageBtn.snp_makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.right.equalTo(0)
            make.height.equalTo(50)
        }
        
//        let bgImage1 = UIImageView(image: UIImage(named: "menu_pic_pulldown_pig1_2x"))
//        self.tableView.tableHeaderView?.addSubview(bgImage1)
//        bgImage1.snp_makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.width.equalTo(80)
//            make.centerX.equalTo(0)
//            make.height.equalTo(40)
//        }
//        let bgImage2 = UIImageView(image: UIImage(named: "menu_pic_pulldown_line"))
//        self.tableView.tableHeaderView?.addSubview(bgImage2)
//        bgImage2.snp_makeConstraints { (make) in
//            make.top.equalTo(bgImage1.snp_bottom).offset(10)
//            make.width.equalTo(self.view.bounds.size.width)
//            make.centerX.equalTo(0)
//            make.height.equalTo(10)
//        }
//        
        self.tableView.bounces = true
        self.tableView.contentInset = UIEdgeInsetsMake(114, 0, 49, 0)
        self.tableView.rowHeight = 120
        self.tableView.registerNib(UINib.init(nibName: String(LessonCell), bundle: nil), forCellReuseIdentifier: String(LessonCell))
    }
    func prepareDataSource(){
        cellInfos = [
            [
                "topImage" : "fengling_pic_icon_hot",
                "title" : "热门推荐",
                "cardImage" : "热门推荐0",
                "card1Image" : "热门推荐1",
                "card2Image" : "热门推荐2"
            ],
            [
                "topImage" : "fenling_pic_icon1_ip4",
                "title" : "认知-卡片",
                "cardImage" : "卡片0",
                "card1Image" : "卡片1",
                "card2Image" : "卡片2"
            ],
            [
                "topImage" : "fenling_pic_icon2_ip4",
                "title" : "语言-儿歌",
                "cardImage" : "儿歌0",
                "card1Image" : "儿歌1",
                "card2Image" : "儿歌2"
            ],
            [
                "topImage" : "fenling_pic_icon2_ip4",
                "title" : "语言-童谣",
                "cardImage" : "童谣0",
                "card1Image" : "童谣1",
                "card2Image" : "童谣2"
            ],
            [
                "topImage" : "fenling_pic_icon3_ip4",
                "title" : "艺术-音乐",
                "cardImage" : "音乐0",
                "card1Image" : "音乐1",
                "card2Image" : "音乐2"
            ],
            [
                "topImage" : "fenling_pic_icon5_ip4",
                "title" : "数学-数学",
                "cardImage" : "数学0",
                "card1Image" : "数学1",
                "card2Image" : "数学2"
            ],
            [
                "topImage" : "fenling_pic_icon1_ip4",
                "title" : "认知-百科",
                "cardImage" : "百科0",
                "card1Image" : "百科1",
                "card2Image" : "百科2"
            ],
            [
                "topImage" : "fenling_pic_icon6_ip4",
                "title" : "右脑-右脑",
                "cardImage" : "右脑0",
                "card1Image" : "右脑1",
                "card2Image" : "右脑2"
            ],
            [
                "topImage" : "fenling_pic_icon2_ip4",
                "title" : "语言-唐诗",
                "cardImage" : "唐诗0",
                "card1Image" : "唐诗1",
                "card2Image" : "唐诗2"
            ]
    ]
        cellModels = NSArray.modelArrayWithClass(CardModel.self, json: cellInfos)!
        self.tableView.reloadData()
}

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension MBPictureViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier(String(LessonCell)) as! LessonCell
        cell.configureWith(cellModels[indexPath.row] as! CardModel)
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
}
