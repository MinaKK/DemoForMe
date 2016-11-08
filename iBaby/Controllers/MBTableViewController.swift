//
//  MBTabelViewController.swift
//  iBaby
//
//  Created by qianfeng on 2016/10/27.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

import SnapKit

class MBTableViewController: ViewController {
    
    var style:UITableViewStyle = UITableViewStyle.Plain
    
    private(set) lazy var tableView:UITableView = {
        let style = self.style
        let tableView = UITableView.init(frame: CGRectZero, style: style)
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = 64
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    var contentInset = UIEdgeInsetsZero{
        didSet{
            //当我们在外部自定义contentInset时，在这儿修改tableView的contentInset和指示器，防止导航条遮挡住tableView内容
            tableView.contentInset = contentInset
            tableView.scrollIndicatorInsets = contentInset
            //设置偏移量防止已经入页面时，tableView被挡住
            tableView.contentOffset = CGPointMake(0, -contentInset.top)
        }
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //将tableView 加到view上并设置tableView的约束等于View的大小
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
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
//MARK:UITableView的代理
extension MBTableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}