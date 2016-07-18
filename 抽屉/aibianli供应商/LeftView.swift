//
//  LeftView.swift
//  aibianli供应商
//
//  Created by XQ on 16/6/29.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit
class LeftView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    // MARK: - 声明变量
    let dataSource = ["采购信息","我的商品","我的提交","我的信息","关于我们"]
    let HEIGTH:CGFloat = 50.0
    var btnTag = 100
    var tempBtn:UIButton = UIButton()
    // MARK: - 重写init方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width = self.frame.size.width
        self.backgroundColor = UIColor.clearColor()
        self.initHeadView(width)
        self.initBtnViews(width, height: 200)
    }
    
    // MARK: - 初始化视图
    // 初始化左视图的头视图，包括图片和电话
    func initHeadView(width:CGFloat) {
        // 头视图
        let headView:UIView = UIView.init(frame: CGRectMake(0, 0, width, 200))
        headView.backgroundColor = UIColor.greenColor()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "headViewTap")
        headView.addGestureRecognizer(tap)
        // 头像
        let headImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, width, 180))
        headImageView.image = UIImage.init(named: "headImage")
        // label
        let telLabel:UILabel = UILabel.init(frame: CGRectMake(0, 180, width, 20))
        telLabel.text = "1234567890"
        // 添加到头视图
        self.addSubview(headView)
        headView.addSubview(headImageView)
        headView.addSubview(telLabel)
        
    }
    // 初始化左视图下边的按钮
    func initBtnViews(width:CGFloat, height:CGFloat) {
        for i in 0..<dataSource.count {
            let temp = CGFloat(i) * HEIGTH  + height
            let btn:UIButton = UIButton(type: .System)
            btn.frame = CGRectMake(0, temp, width, HEIGTH)
            btn.setTitle(dataSource[i], forState: .Normal)
            btn.tag = 100 + i
            if i == 0 {
                btn.selected = true
            }
            btn.backgroundColor = UIColor.grayColor()
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Selected)
            btn.addTarget(self, action: "funcBtnAction:", forControlEvents: .TouchUpInside)
            btn.titleLabel?.font = UIFont.systemFontOfSize(25.0)
            self.addSubview(btn)
        }
    }
    // MARK: - 按钮点击方法
    func funcBtnAction(sender:UIButton) {
        
        //if btnTag != 0 {
            tempBtn = self.viewWithTag(btnTag) as! UIButton
        
        
        if sender.tag != btnTag {
            sender.selected = !sender.selected
            tempBtn.selected = !tempBtn.selected
        }
        //print(sender.tag)
        btnTag = sender.tag
        
        let lokerVC:ViewController = self.superview?.nextResponder() as! ViewController
        lokerVC.rigntView.dataSource.removeAll()
        for i in 0..<10 {
            lokerVC.rigntView.dataSource.append("\(i) + \(sender.titleLabel?.text)")
        }
        lokerVC.rigntView.tableView.reloadData()
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        lokerVC.rigntView.showView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
    //NSNotificationCenter.defaultCenter().postNotificationName("changeBounds", object: nil)
    }
    // MARK: - 头视图点击方法
    // 头视图的点击手势
    func headViewTap() {
        
    }
    // MARK: - 系统方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
