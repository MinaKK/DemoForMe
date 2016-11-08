//
//  UILabel+Util.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

//UILabel的类扩展
extension UILabel{
    
    class func createLabel(frame:CGRect,text:String?,textAlignment:NSTextAlignment?)->UILabel{
        
        let label = UILabel(frame: frame)
        label.text = text
        label.textColor = UIColor.whiteColor()
        if let tmpAlignment = textAlignment{
            label.textAlignment = tmpAlignment
        }
        return label
    }
    
}

//UIButton的类扩展
extension UIButton{
    
    class func createBtn(frame:CGRect,title:String?,bgImageName:String?)->UIButton{
        let btn = UIButton(type: .Custom)
        btn.frame = frame
        if let tmpTitle = title{
            btn.setTitle(tmpTitle, forState: .Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }
        if let imageName = bgImageName{
            btn.setImage(UIImage(named: imageName),forState: .Normal)
        }
        return btn
    }
}
