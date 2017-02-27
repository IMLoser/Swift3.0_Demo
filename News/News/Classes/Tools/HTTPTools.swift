//
//  HTTPTools.swift
//  News
//
//  Created by 曹航玮 on 2017/2/25.
//  Copyright © 2017年 曹航玮. All rights reserved.
//

import UIKit
import Alamofire

enum requestType {
    case get
    case post
}

class HTTPTools: NSObject {

    
    /// 网络请求方法
    ///
    /// - Parameter urlStr: URL字符串
    class func requestWith(urlStr : String, parameters : [String : Any]? = nil, type : requestType, _ callBack : @escaping (_ result : Any)->()) {
    
        guard urlStr.characters.count != 0 else {
            return
        }
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlStr, method: method, parameters: parameters).responseJSON { (response) in
            
            // 校验
            guard let result = response.result.value else {
                
                guard let error = response.result.error else {return}
                print(error)
                return
            }
            
            // 回调请求到的数据
            callBack(result)
        }
    }
    
}
