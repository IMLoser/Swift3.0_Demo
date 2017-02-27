//
//  NewsModel.swift
//  News
//
//  Created by 曹航玮 on 2017/2/26.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

import UIKit

class NewsModel: NSObject {

    var title : String = ""
    var imgsrc : String = ""
    var source : String = ""
    var votecount : Int = 0
    
    
    class func newsModelWith(_ dict : [String : Any]) -> NewsModel {
        
        let model = NewsModel()
        model.setValuesForKeys(dict)
        return model
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
