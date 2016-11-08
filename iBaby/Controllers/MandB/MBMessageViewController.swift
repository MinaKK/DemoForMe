//
//  MBMessageViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/3.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBMessageViewController: MBScrollerViewController {

    //var displayController = YZDisplayViewController.init()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationItem.title = "我的消息"
        self.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        configureTopTitle()
        
    }
    func  configureTopTitle(){
        let bgImage = UIImageView(image: UIImage(named: "mb_pic_messagenone_2x"))
        self.view.addSubview(bgImage)
        bgImage.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        let btnArr = ["用户消息","系统消息"]
        var lastView : UIButton? = nil
        for btnTitle in btnArr{
            let btn = UIButton(type: .Custom)
            btn.setTitleColor(UIColor.brownColor(), forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.jk_setBackgroundColor(UIColor ( red: 0.902, green: 0.902, blue: 0.902, alpha: 1.0 ), forState: .Normal)
            btn.setTitle(btnTitle, forState: .Normal)
            btn.titleLabel?.textAlignment = .Center
            bgImage.addSubview(btn)
            btn.snp_makeConstraints(closure: { (make) in
                make.left.equalTo(lastView == nil ? bgImage.snp_left : (lastView?.snp_right)!).offset(lastView == nil ? 0 : 1)
                make.width.equalTo(bgImage).dividedBy(btnArr.count)
                make.height.equalTo(44)
            })
            lastView = btn
        }
    }
    func configureTitleScroll(){
        //下划线
        
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
