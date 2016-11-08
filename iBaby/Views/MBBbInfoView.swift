//
//  MBBbInfoView.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/31.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class MBBbInfoView: UIViewController {

    @IBOutlet weak var babyIcon: UIImageView!
    
    @IBOutlet weak var princessBtn: UIButton!
    
    @IBOutlet weak var princeBtn: UIButton!
    
    @IBAction func babyName(sender: AnyObject) {
        
    }
    @IBAction func babyBirthday(sender: AnyObject) {
    }
    
    @IBAction func princessBtn(sender: AnyObject) {
        princessBtn.setBackgroundImage(UIImage(named: "babyxinxi_btn_anniugongzhu_2x"), forState: .Selected)
        
    }
    
    @IBAction func princeBtn(sender: AnyObject) {
        princeBtn.setBackgroundImage(UIImage(named: "babyxinxi_btn_anniuwangzi_2x"), forState: .Selected)
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
