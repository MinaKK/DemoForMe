//
//  MBBaseViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/1.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let topBtn = UIButton.createBtn(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2), title: nil, bgImageName: nil)
        topBtn.setBackgroundImage(UIImage(named: "menu_btn_imbaby_normal"), forState: .Normal)
        topBtn.setBackgroundImage(UIImage(named: "menu_btn_imbaby_highlight"), forState: .Highlighted)
        topBtn.addTarget(self, action: #selector(clickTopBtn), forControlEvents: .TouchUpInside)
        self.view.addSubview(topBtn)
        
        let downBtn = UIButton.createBtn(CGRectMake(0, self.view.bounds.size.height/2-10, self.view.bounds.size.width, self.view.bounds.size.height/2+10), title: nil, bgImageName: nil)
        downBtn.setBackgroundImage(UIImage(named: "menu_btn_immama_normal"), forState: .Normal)
        downBtn.setBackgroundImage(UIImage(named: "menu_btn_immama_highlight"), forState: .Highlighted)
        downBtn.addTarget(self, action: #selector(clickDownBtn), forControlEvents: .TouchUpInside)
        self.view.addSubview(downBtn)

    }
    func clickTopBtn(){
        
        let subWindow = (UIApplication.sharedApplication().keyWindow)!
        subWindow.rootViewController = MBBabysViewController()

    }

    func clickDownBtn(){
        
        let bgView =  UIView()
        bgView.frame = UIScreen.mainScreen().bounds
        bgView.backgroundColor = UIColor ( red: 0.498, green: 0.498, blue: 0.498, alpha: 0.7 )
        
        self.view.addSubview(bgView)
        //显示手势滑动的界面
        let showView = UIView()
        showView.backgroundColor = UIColor.whiteColor()
        showView.frame = CGRectMake(10, self.view.bounds.size.height/2-100, 300, 150)
        showView.layer.cornerRadius = 10
        showView.layer.masksToBounds = true
        showView.clipsToBounds = false
        bgView.addSubview(showView)
        
        let mmImage = UIImageView(image:UIImage(named: "menu_pic_mamaf_highlight_2x"))
        showView.addSubview(mmImage)
        mmImage.snp_makeConstraints { (make) in
            make.top.equalTo(-10)
            make.left.equalTo(20)
            make.width.equalTo(70)
            make.height.equalTo(100)
        }
        
        let descLabel1 = UILabel.createLabel(CGRectMake(100, 20, 150, 20), text: "为了确保您就是家长", textAlignment: .Center)
        descLabel1.font = UIFont.systemFontOfSize(15)
        descLabel1.textColor = UIColor.lightGrayColor()
        showView.addSubview(descLabel1)
        let descLabel2 = UILabel.createLabel(CGRectMake(100, 41, 150, 20), text: "请按照下方指示操作", textAlignment: .Center)
        descLabel2.font = UIFont.systemFontOfSize(15)
        descLabel2.textColor = UIColor.lightGrayColor()
        showView.addSubview(descLabel2)
        
        let swipeImage = UIImageView(image: UIImage(named: "image_myexchangecode_top_bg"))
        swipeImage.userInteractionEnabled = true
        showView.addSubview(swipeImage)
        swipeImage.snp_makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        
        let swipelabel = UILabel()
        swipelabel.text = "在这里用手向左滑动"
        swipelabel.textColor = UIColor ( red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0 )
        swipelabel.font = UIFont.systemFontOfSize(18)
        swipelabel.textAlignment = .Center
        swipeImage.addSubview(swipelabel)
        swipelabel.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        //添加滑动手势
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        leftSwipeGesture.direction = .Left
        swipeImage.addGestureRecognizer(leftSwipeGesture)
    }
    func swipeAction(leftSwipe:UISwipeGestureRecognizer){
        print("收视已经显示美国飞机")
        var subWindow = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        subWindow = (UIApplication.sharedApplication().keyWindow)!
        subWindow.rootViewController = MBTabBarController()
        subWindow.makeKeyAndVisible()
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
