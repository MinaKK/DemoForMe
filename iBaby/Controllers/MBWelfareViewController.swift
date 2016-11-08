//
//  MBWelfaleViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/29.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBWelfareViewController: CSScrollerViewController {

    let image3 = UIImageView(image: UIImage(named: "app_bg"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor ( red: 0.4, green: 0.8, blue: 1.0, alpha: 0.7)
        self.view.userInteractionEnabled = true
        
        //蓝色背景图
        let bgView = UIImageView(image: UIImage(named: "Default-Portrait"))
        bgView.frame = UIScreen.mainScreen().bounds
        bgView.userInteractionEnabled = true
        self.view.insertSubview(bgView, atIndex: 0)
        //滚动视图
        self.automaticallyAdjustsScrollViewInsets = false
       
        //调用添加图片的方法
        addView()
        
    }
    func addView(){
        //滚动视图
        let image1 = UIImageView(image: UIImage(named: "toyshop"))
        self.contentView.addSubview(image1)
        image1.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(200)
        }
        //添加手势来隐藏和显示导航条
        image1.userInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action:#selector(MBWelfareViewController.tap1Action(_:)))
        image1.addGestureRecognizer(tap1)
        
        let image2 = UIImageView(image: UIImage(named: "hotlink_bg"))
        self.contentView.addSubview(image2)
        image2.snp_makeConstraints { (make) in
            make.top.equalTo(image1.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(200)
        }
        
        //动态图
        let shopLightView = UIImageView()
        let data = NSData.init(contentsOfFile: NSBundle.mainBundle().pathForResource("toyshop_light_2", ofType: "gif")!)
        let picture = UIImage.jk_animatedImageWithAnimatedGIFData(data)
        shopLightView.image = picture
        image3.addSubview(shopLightView)
        shopLightView.snp_makeConstraints { (make) in
            make.top.equalTo(40)
            make.left.equalTo(5)
            make.width.equalTo(310)
            make.height.equalTo(150)
        }
        
        //点击进入
        let pigBtn = UIButton(type: .Custom)
        pigBtn.setBackgroundImage(UIImage(named: "hotlink_1"), forState: .Normal)
        image2.addSubview(pigBtn)
        pigBtn.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(30)
            make.width.height.equalTo(130)
        }
        
        let elephantBtn = UIButton(type: .Custom)
        elephantBtn.setBackgroundImage(UIImage(named: "hotlink_baidu"), forState: .Normal)
        image2.addSubview(elephantBtn)
        elephantBtn.snp_makeConstraints { (make) in
            make.top.equalTo(pigBtn)
            make.right.equalTo(-20)
            make.width.height.equalTo(130)
        }
        
        self.contentView.addSubview(image3)
        image3.snp_makeConstraints { (make) in
            make.top.equalTo(image2.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(200)
        }
        //应用推荐
        let btn1 = createAPP("app_icon_tingting",inplace: 20,text: "宝宝听听\n早教APP")
        image3.addSubview(btn1)
        let btn2 = createAPP("app_icon_cb", inplace: 120, text: "宝宝唱吧\n早教APP")
        image3.addSubview(btn2)
        let btn3 = createAPP("app_icon_rzk", inplace: 220, text: "宝宝认知卡\n早教APP")
        image3.addSubview(btn3)
        
        let image4 = UIImageView(image: UIImage(named: "inapplink_bg"))
        self.contentView.addSubview(image4)
        image4.snp_makeConstraints { (make) in
            make.top.equalTo(image3.snp_bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(200)
        }
        let starBtn = UIButton(type: .Custom)
        starBtn.setBackgroundImage(UIImage(named: "inapplink_5star_iphone"), forState: .Normal)
        image4.addSubview(starBtn)
        starBtn.snp_makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(80)
            make.center.equalTo(0)
        }
        //继承自封装好的滚动视图，将所有的图片视图加到contentview上，只要让滚动视图的内容视图的底部超过最后一张图片的底部即可。
        self.contentView.snp_makeConstraints { (make) in
            make.bottom.greaterThanOrEqualTo(image4.snp_bottom)
        }
    }
    func tap1Action(tap:UITapGestureRecognizer){
        if self.navigationController?.navigationBarHidden == true{
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }else{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    //封装创建应用APP的方法
    func createAPP(image:String?,inplace:CGFloat?,text:String?)->UIButton{
        let btn = UIButton(type: .Custom)
        btn.setBackgroundImage(UIImage(named: image!), forState: .Normal)
        image3.addSubview(btn)
        btn.snp_makeConstraints { (make) in
            make.top.equalTo(55)
            make.width.height.equalTo(80)
            make.left.equalTo(inplace!)
        }
        let label = UILabel()
        label.text = text
        label.numberOfLines = 1
        label.textColor = UIColor.blueColor()
        label.font = UIFont.systemFontOfSize(10)
        image3.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.top.equalTo(btn.snp_bottom).offset(3)
            make.left.equalTo(btn)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        let image = UIImageView(image: UIImage(named: "5star"))
        image3.addSubview(image)
        image.snp_makeConstraints { (make) in
            make.top.equalTo(label.snp_bottom).offset(5)
            make.left.equalTo(label)
        }
        return btn
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
