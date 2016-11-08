//
//  HomeCell.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/2.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureWith(model: ListModel){
        let url = NSURL(string: model.pic_url!)
        bigImage.setImageWithURL(url, placeholder: UIImage(named: "index_pic_right01_2x"))
        descLabel.text = model.thread_title
        messageLabel.text = "评论:" + "\((model.reply_count)!)"
        titleLabel.text = model.top_title

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
