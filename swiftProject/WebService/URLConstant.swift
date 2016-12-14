//
//  URLConstant.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation
import Alamofire

/*
 param : method     请求方式
 param : suffix     后缀，url之间不同的部分
 */
typealias   subUrl = (method : HTTPMethod, suffix : String)



struct URLConstant  {
    
    static let baseUrl = "http://3t.hengtiansoft.com/3t-mobile-user/app/"
    
    struct test {
        static let getcity = subUrl(.post ,"home/getAllOpenCitys")
    }
    
    
}
