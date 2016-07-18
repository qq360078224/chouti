//
//  ViewController.swift
//  aibianli供应商
//
//  Created by XQ on 16/6/29.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - 声明变量
    // 抽屉是否打开
    var isOpen = false
    // 左视图
    var leftView:LeftView = LeftView()
    // 右视图
    var rigntView:RightView = RightView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "xxxxxx"
        self.edgesForExtendedLayout = UIRectEdge.None
        
        // Do any additional setup after loading the view, typically from a nib.
        self.initLokerView()
        self.addBarItem()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeBounds", name: "changeBounds", object: nil)
    
    }
    // MARK: - 初始化视图
    // 初始化左右视图
    func initLokerView() {
        //left
        leftView = LeftView.init(frame: CGRectMake(-SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT))
        self.view.addSubview(leftView)
        // right
        rigntView = RightView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        self.view.addSubview(rigntView)

    }
    // MARK: - 添加barItem
    // 添加nav的左Btn
    func addBarItem() {
    
        let image = UIImage(named: "leftItem")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let leftItem:UIBarButtonItem = UIBarButtonItem.init(image: image, style: UIBarButtonItemStyle.Done, target: self, action: "barItemAction")
        self.navigationItem.leftBarButtonItem = leftItem
    
    }
    // 点击左Btn，使抽屉开关
    func barItemAction() {
        NSNotificationCenter.defaultCenter().postNotificationName("changeBounds", object: self.isOpen)        
    }
    // MARK: - 通知方法
    // 响应开关抽屉的通知
    func changeBounds() {
        
        if isOpen {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.bounds.origin.x += SCREEN_WIDTH/2
            })
        }else {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.bounds.origin.x -= SCREEN_WIDTH/2
            })
        }
        isOpen =  !isOpen
    }
    // MARK: - 系统方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}










