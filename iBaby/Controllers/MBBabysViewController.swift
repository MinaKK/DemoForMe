//
//  MBBabysViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/7.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import ZFPlayer

class MBBabysViewController: UIViewController {

    var playerView = ZFPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        getVideo()
        
        createVideoPlayer()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.LandscapeRight.rawValue, forKey: "orientation")
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKeyPath: "orientation")
    }
    func getVideo()->NSURL{
        //取出文件
        let localPath = NSBundle.mainBundle().pathForResource("泡泡岛开场动画", ofType: "mp4")
        let url = NSURL(fileURLWithPath: localPath!)
        return url
    }
    //创建媒体播放库
    func createVideoPlayer(){
        self.view.addSubview(playerView)
        playerView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        playerView.videoURL = getVideo()
        playerView.autoPlayTheVideo()
        playerView.goBackBlock = {
            var subWindow = UIWindow.init(frame: UIScreen.mainScreen().bounds)
            subWindow = (UIApplication.sharedApplication().keyWindow)!
            subWindow.rootViewController = MBTabBarController()
            subWindow.makeKeyAndVisible()
        }
    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.LandscapeRight
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
