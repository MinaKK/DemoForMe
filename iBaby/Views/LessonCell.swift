//
//  LessonCell.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/8.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class LessonCell: UITableViewCell {

    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var cardBtn: UIButton!
    
    @IBOutlet weak var card1Btn: UIButton!
    
    @IBOutlet weak var card2Btn: UIButton!
    
    @IBAction func cardBtn(sender: AnyObject) {
        
    }
    
    @IBAction func card1Btn(sender: AnyObject) {
    }
    
    @IBAction func card2Btn(sender: AnyObject) {
    }
    
    @IBAction func moreBtn(sender: AnyObject) {
        moreBtn.setBackgroundImage(UIImage(named: "menu_btn_moreclass_highlight_ip4"), forState: .Selected)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureWith(model:CardModel){
        self.topImage.image = UIImage(named:(model.topImage)!)
        self.title.text = (model.title)!
        self.card1Btn.setBackgroundImage(UIImage(named: (model.card1Image)!), forState: .Normal)
        self.card2Btn.setBackgroundImage(UIImage(named: (model.card2Image)!), forState: .Normal)
        self.cardBtn.setBackgroundImage(UIImage(named: (model.cardImage)!), forState: .Normal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
