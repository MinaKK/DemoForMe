//
//  ADCell.swift
//  iBaby
//
//  Created by qianfeng on 2016/11/1.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import YYKit

//自定义表格视图
class ADCell: UITableViewCell,UIScrollViewDelegate {

    @IBOutlet weak var adScrollView: UIScrollView!
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let titleName = UILabel()
    
    let pageCtrl = UIPageControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var advArray: NSArray! {
        
        didSet {
            
            self.adScrollView.removeAllSubviews()
            
            for i in 0..<(advArray?.count)! {
                //模型对象
                let frame = CGRectMake(320*CGFloat(i), 0, 320, 120)
                let imageView = UIImageView(frame: frame)
                let url = NSURL(string:(advArray[i] as! ADModel).pic_url!)
                imageView.setImageWithURL(url, placeholder:UIImage(named: "mb_pic_loading_iphone"))
                self.adScrollView.addSubview(imageView)
                
            }
            self.adScrollView.delegate = self
            self.adScrollView.pagingEnabled = true
            self.adScrollView.bounces = false
            self.adScrollView.showsHorizontalScrollIndicator = false
            self.adScrollView.contentSize = CGSizeMake(320*CGFloat(advArray!.count), 120)
            //分页
            self.pageCtrl.numberOfPages = advArray!.count
        }
        
    }
    
    func configureWith(models: NSArray) {
        
        messageLabel.text = "评论:" + "\(((models[2] as! ADModel).reply_count)!)"
        titleName.text = (models[0] as! ADModel).thread_type_name
         nameLable.text = (models[1] as! ADModel).thread_title
        self.advArray = models

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//MARK: UIScrollView代理
extension ADCell{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        self.pageCtrl.currentPage = index
       
    }
    
}

