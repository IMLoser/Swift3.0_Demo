//
//  HomeViewController.swift
//  News
//
//  Created by 曹航玮 on 2017/2/25.
//  Copyright © 2017年 曹航玮. All rights reserved.
//  OC : AFNetworking   Swift : Alamofile
//  http://c.m.163.com/nc/article/list/T1348649079062/0-20.html

import UIKit

// MARK: 类的声明
class HomeViewController: UITableViewController {

    // 保存数据模型的数组
    lazy var modelArray : [NewsModel] = {
        
        var tmpArr : [NewsModel] = Array()
        
        // 利用网络工具类发送网络请求
        HTTPTools.requestWith(urlStr: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", parameters: nil, type: .get) { (response) in
            
            // 转换字典
            guard let dataDict = response as? [String : Any] else {return}
            guard let dataArr = dataDict["T1348649079062"] as? [Any] else {return}
            
            // 循环初始化数据模型
            for dict in dataArr {
                guard let dict = dict as? [String : Any] else {continue}
                tmpArr.append(NewsModel.newsModelWith(dict))
            }
            
            self.modelArray = tmpArr
            
            // 刷新界面
            self.tableView.reloadData()
        }

        return tmpArr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航条
        settingNav()

        // 注册cell
        tableView.register(UINib(nibName: "HWHomeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}

// MARK: 设置界面
extension HomeViewController {
    
    fileprivate func settingNav() {
        
        // 设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "reader_navigation_background"), for: .default)
        
        // 设置title
        navigationItem.titleView = UIImageView(image: UIImage(named: "navigation_logo"))
        
        // 设置搜索按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_search"), style: .plain, target: self, action: #selector(searchingClick))
    }
    
}

// MARK: 事件监听
extension HomeViewController {
    
    @objc fileprivate func searchingClick() {
        
        print("点击搜索···")
    }
}

// tableView 代理 & 数据源
extension HomeViewController {
    
    // 返回多少行cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.modelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HWHomeCell
        let model = self.modelArray[indexPath.row]
        cell.homeCellWith(cellModel: model)
        
        return cell
    }
    
    // 返回cell高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

