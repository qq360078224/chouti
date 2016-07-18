//
//  RightView.swift
//  aibianli供应商
//
//  Created by XQ on 16/6/29.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class RightView: UIView, UITableViewDelegate, UITableViewDataSource {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var tableView:UITableView = UITableView()
    var showView:UIView = UIView()
    var dataSource:Array<String> = Array()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initSubViews()
        self.addTap()
        self.addSwipe()
        
    }
    
    // MARK: - 添加子视图
    func initSubViews() {
        // tableView
        tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2))
        tableView.backgroundColor = UIColor.redColor()
        tableView.dataSource = self
        tableView.delegate = self
        // showView
        showView = UIView.init(frame: CGRectMake(0, SCREEN_HEIGHT/2, SCREEN_WIDTH, SCREEN_HEIGHT/2))
        showView.backgroundColor = UIColor.yellowColor()
        // 添加子视图
        self.addSubview(tableView)
        self.addSubview(showView)
        
//        for i in 0..<10 {
//           dataSource.append("\(i)")
//        }
    }
    // MARK: - 协议方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.row]
        print("=====")
        return cell
    }
    // MARK: - 添加手势
    // 添加点击手势
    func addTap() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapAciont")
        self.addGestureRecognizer(tap)
    }
    // 点击手势事件
    func tapAciont() {
        let lokerVC:ViewController = self.superview?.nextResponder() as! ViewController
        if lokerVC.isOpen {
        NSNotificationCenter.defaultCenter().postNotificationName("changeBounds", object: nil)
            
        }
    }
    // 添加轻扫手势
    func addSwipe() {
        //左
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeLeftAciont")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(swipeLeft)
        // 右
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRightAciont")
        self.addGestureRecognizer(swipeRight)
    }
    // 轻扫手势事件
    // 左
    func swipeLeftAciont() {
        let lokerVC:ViewController = self.superview?.nextResponder() as! ViewController
        if lokerVC.isOpen {
    NSNotificationCenter.defaultCenter().postNotificationName("changeBounds", object: nil)
        }
    }
    // 右
    func swipeRightAciont() {
        let lokerVC:ViewController = self.superview?.nextResponder() as! ViewController
        if !lokerVC.isOpen {
    NSNotificationCenter.defaultCenter().postNotificationName("changeBounds", object: nil)
        }
    }
    // MARK: - 系统方法
    // system
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
