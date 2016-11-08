//
//  CSScrollerViewController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSScrollerViewController: UIViewController {
	
	private(set) lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView.init()
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.backgroundColor = UIColor.whiteColor()
		
		return scrollView
	}()
	
	private(set) lazy var contentView: UIView = {
		let contentView = UIView.init()
		contentView.backgroundColor = UIColor.blueColor()
		
		return contentView
	}()
	
	var contentInset = UIEdgeInsetsMake(64, 0, 0, 0) {
		didSet {
			scrollView.contentInset = contentInset
			scrollView.scrollIndicatorInsets = contentInset
			scrollView.contentOffset = CGPointMake(0, -contentInset.top)
			
			// 更新 contentView 的高度约束
			contentView.snp_updateConstraints { (make) in
				make.height.greaterThanOrEqualTo(view).offset(1 - contentInset.top - contentInset.bottom)
			}
		}
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.view.addSubview(scrollView)
		scrollView.addSubview(contentView)
	
		// 需要在 scrollView 内部添加一个内容视图，将 scrollView 撑起来
		contentView.snp_makeConstraints { (make) in
			make.edges.equalTo(0)
			make.width.equalTo(scrollView)
			make.height.greaterThanOrEqualTo(view).offset(1)
		}
		scrollView.snp_makeConstraints { (make) in
			make.edges.equalTo(0)
			make.bottom.equalTo(contentView.snp_bottom)
		}
		
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
