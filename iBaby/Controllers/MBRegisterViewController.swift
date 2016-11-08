//
//  MBRegisterViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/28.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBRegisterViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "邮箱注册"
        self.view.backgroundColor = UIColor.whiteColor()
        //用户邮箱
        let userEmail = UITextField.init()
        userEmail.placeholder = "请输入您的邮箱"
        userEmail.borderStyle = .RoundedRect
        userEmail.font = UIFont.systemFontOfSize(15)
        userEmail.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(userEmail)
        userEmail.snp_makeConstraints { (make) in
            make.top.equalTo(84)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(50)
        }
        //        userEmail.layer.borderColor = UIColor.lightGrayColor().CGColor
        //        userEmail.layer.borderWidth = 0.5
        
        //用户密码
        let password = UITextField.init()
        password.placeholder = "请输入您的密码"
        password.borderStyle = .RoundedRect
        password.font = UIFont.systemFontOfSize(15)
        password.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(password)
        password.snp_makeConstraints { (make) in
            make.top.equalTo(userEmail.snp_bottom)
            make.left.equalTo(userEmail.snp_left)
            make.right.equalTo(userEmail.snp_right)
            make.height.equalTo(userEmail.snp_height)
        }
        password.secureTextEntry = true
        //        password.layer.borderWidth = 0.5
        //        password.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        //确认密码
        let confirmPassword = UITextField()
        confirmPassword.placeholder = "确认密码"
        confirmPassword.borderStyle = .RoundedRect
        confirmPassword.font = UIFont.systemFontOfSize(15)
        confirmPassword.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(confirmPassword)
        confirmPassword.snp_makeConstraints { (make) in
            make.top.equalTo(password.snp_bottom)
            make.left.equalTo(password.snp_left)
            make.right.equalTo(password.snp_right)
            make.height.equalTo(password.snp_height)
        }
        
        //注册按钮
        let registerBtn = UIButton.init(type: .Custom)
        registerBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        registerBtn.setTitle("注册", forState: .Normal)
        registerBtn.titleLabel?.textAlignment = .Center
        registerBtn.layer.cornerRadius = 5
        registerBtn.layer.masksToBounds = true
        registerBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.502, blue: 0.0, alpha: 1.0 ), forState: .Normal)
        registerBtn.jk_setBackgroundColor(UIColor ( red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0 ),forState: .Highlighted)
        registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(),forState: .Disabled)
        registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            //使用封装的网络帮助类请求数据
        }
        self.view.addSubview(registerBtn)
        registerBtn.snp_makeConstraints { (make) in
            make.left.equalTo(userEmail.snp_left)
            make.top.equalTo(confirmPassword.snp_bottom).offset(20)
            make.right.equalTo(userEmail.snp_right)
            make.height.equalTo(userEmail.snp_height)
        }
        
        //注册后将保留您的访客数据到此注册用户
        let wordLabel = UILabel()
        wordLabel.text = "注册后将保留您的访客数据到此注册用户"
        wordLabel.font = UIFont.systemFontOfSize(10)
        wordLabel.textColor = UIColor.lightGrayColor()
        self.view.addSubview(wordLabel)
        wordLabel.snp_makeConstraints { (make) in
            make.top.equalTo(registerBtn.snp_bottom).offset(8)
            make.left.equalTo(registerBtn.snp_left)
            make.width.equalTo(300)
            make.height.equalTo(10)
        }
        
        //快速注册
        let label = UILabel()
        label.text = "快速注册"
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.top.equalTo(registerBtn.snp_bottom).offset(30)
            make.left.equalTo(registerBtn.snp_left)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        let qqBtn = UIButton(type: .Custom)
        qqBtn.setImage(UIImage(named:"mine_btn_qq_normal_iphone"), forState: .Normal)
        qqBtn.setImage(UIImage(named: "mine_btn_qq_highlight_iphone"), forState: .Highlighted)
        qqBtn.jk_handleControlEvents(.TouchUpInside) { (snder) in
            //进入QQ登录
        }
        self.view.addSubview(qqBtn)
        qqBtn.snp_makeConstraints { (make) in
            make.top.equalTo(registerBtn.snp_bottom).offset(40)
            make.left.equalTo((self.view.bounds.size.width-200)/3)
            make.width.height.equalTo(100)
        }
        let weiboBtn = UIButton(type: .Custom)
        weiboBtn.setImage(UIImage(named: "mine_btn_sina_normal_iphone"), forState: .Normal)
        weiboBtn.setImage(UIImage(named: "mine_btn_sina_highlight_iphone"), forState: .Highlighted)
        weiboBtn.jk_handleControlEvents(.TouchUpInside) { (sender) in
            //进入微博登录
        }
        self.view.addSubview(weiboBtn)
        weiboBtn.snp_makeConstraints { (make) in
            make.right.equalTo(-(self.view.bounds.size.width-200)/3)
            make.width.height.equalTo(100)
            make.top.equalTo(qqBtn.snp_top)
        }
        let qqLabel = UILabel.createLabel(CGRectMake((self.view.bounds.size.width-200)/3, 430, 100, 15), text: "腾讯QQ", textAlignment: .Center)
        qqLabel.textColor = UIColor.blackColor()
        qqLabel.font = UIFont.systemFontOfSize(10)
        let weiboLabel = UILabel.createLabel(CGRectMake(((self.view.bounds.size.width-200)/3)*2+100, 430, 100, 15), text: "新浪微博", textAlignment: .Center)
        weiboLabel.textColor = UIColor.blackColor()
        weiboLabel.font = UIFont.systemFontOfSize(10)
        self.view.addSubview(qqLabel)
        self.view.addSubview(weiboLabel)

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
