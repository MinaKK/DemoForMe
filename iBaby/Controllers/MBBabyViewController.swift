//
//  MBBabyViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/2.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit



import MediaPlayer

class MBBabyViewController: UIViewController {


    var vedioPlayer : MPMoviePlayerController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor ( red: 0.4, green: 0.8, blue: 1.0, alpha: 1.0 )
        
        //调用获取视频地址的方法
        getVideo()
      
        //调用视频播放的方法
        createVideoPlayer()
    }
    func getVideo()->NSURL{
        //取出文件
        let localPath = NSBundle.mainBundle().pathForResource("泡泡岛开场动画", ofType: "mp4")
        let url = NSURL(fileURLWithPath: localPath!)
        return url

    }
    //创建媒体播放库
    func createVideoPlayer(){
       if  self.vedioPlayer == nil{
           // UIDevice.currentDevice().setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
            let url:NSURL = getVideo()
            vedioPlayer = MPMoviePlayerController(contentURL: url)
            vedioPlayer!.view.frame = self.view.bounds
            vedioPlayer?.prepareToPlay()
            vedioPlayer?.shouldAutoplay = true
            self.view.addSubview((vedioPlayer!.view)!)
        }
        let notifi = NSNotificationCenter.defaultCenter()
        notifi.addObserver(self, selector: #selector(playBackFinished(_:)), name: MPMoviePlayerPlaybackDidFinishNotification, object: vedioPlayer)
        
    }
    //播放完成调用
    func playBackFinished(notifi:NSNotificationCenter){
        
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
