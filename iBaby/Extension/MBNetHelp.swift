//
//  MBNetHelp.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/31.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
//下载数据的第三方库
import Alamofire

public class MBNetHelp: NSObject {
    
    //在Alamofire的基础上封装一个网络帮助类，把不需要的参数隐藏掉，使得调用更方便
    public class func request(
        
        method: Alamofire.Method = .POST,URLString: String,parameters: [String:AnyObject],headers: [String:String]? = nil
        
        )->Alamofire.Request{
        
        return Alamofire.request(method,URLString,parameters:parameters,encoding: .URL,headers:headers)
        
    }
    
}

extension Request{
    
    //封装网络回调的方法，可以更方便的统一处理错误，在具体数据处理时更简单
    func responseJSON(comletionHandler:(data:AnyObject,success:Bool)->Void)->Self{
        
        return responseJSON(completionHandler: { (response) in
            
            let result = response.result
            
            var success = false
            
            var data : AnyObject = "网络有问题，请重试"
            
            if result.isSuccess{
                
                let serverData = result.value as! NSDictionary
                
                let serverRet = serverData["ret"] as! Int
                
                if serverRet != 200{//请求出现问题
                    
                    data = serverData["msg"]!
                    
                }else{//请求成功
                    
                    let retValue = serverData["data"] as! NSDictionary
                    
                    //取出操作码
                    let retCode = retValue["code"] as! Int
                    
                    if retCode == 0{//操作成功
                        
                        success = true
                        
                        data = retValue["data"]!
                        
                    }else{
                        
                        data = retValue["msg"]!
                        
                    }
                    
                }
                
            }else{
                
                data = (result.error?.localizedDescription)!
            }
            //调用回调传入的回调闭包，如果成功就返回请求的数据，如果失败就返回原因
            comletionHandler(data:data,success: success)
            
        })
        
    }
    
    
}
