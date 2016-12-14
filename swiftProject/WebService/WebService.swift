//
//  WebService.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation
import ReachabilitySwift
import HandyJSON
import Alamofire

class WebService {
    
    //one of the Singleton designed
    static let webServiceRequest = WebService()
    
    private var headers:[String:String]!
    private init(){
        //... to do some initialization
        
        headers = [String: String]()
        headers["source"] = "ios"
        headers["X-Requested-With"] = "XMLHttpRequest"
    }
    
    
    /// http 网络请求
    ///
    /// - parameter URL:            请求地址
    /// - parameter parameters:     请求参数
    /// - parameter requestSuccess: 成功回调
    /// - parameter requestFail:    失败回调
    func httpRequest(URL:subUrl,parameters:[String: AnyObject]? = nil, requestSuccess:@escaping (AnyObject)-> Void,requestFail:@escaping (AnyObject)->Void) {
        
     let request = self.alamostFireRequest(method: URL.method, URLString:URLConstant.baseUrl + URL.suffix , parameters: nil)
        guard request != nil else{
            return
        }
        
        request?.responseJSON{(response) in
            let result = response.result.value
            if response.result.isSuccess {
                let status = response.response?.statusCode
                if status == 200  {
                    requestSuccess(result as AnyObject)
                }else if status == 201 {
                    requestSuccess(result as AnyObject)
                }else if status == 400 {
                    requestFail("mobile_and_password_and_locale_required" as AnyObject)
                }else if status == 500 {
                    requestFail("cannot_authenticate" as AnyObject)
                }else if status == 502 {
                    requestFail("Internal server error" as AnyObject)
                }else{
                    requestFail("unknow error" as AnyObject)
                }
            }else{
                requestFail(response.result.error?.localizedDescription as AnyObject)
            }
        }
        

    }

    /// 网络请求
    ///
    /// - parameter method:     请求类型
    /// - parameter URLString:  请求路径
    /// - parameter parameters: 请求参数
    func alamostFireRequest(
        method: HTTPMethod = .get,
        URLString: String,
        parameters: [String: AnyObject]?
        )-> DataRequest?{
        
        //Parameters of the log
        var dataLog = "There is no request parameters"
        if let param = parameters{
            let data = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
            let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String
            dataLog = self.replaceUnicode(unicodeStr: strJson)
        }
        print( "\n the method \(method.rawValue) \n DATA:\(dataLog) \nTo Path \(URLString)")
        
        //save token to http header
//        let token = UserDefaults.standard.object(forKey: UserDefaultKeys.TOKEN) as? String
//        headers["token"] = token
        
        /*
         注意：
         param : encoding ; 1。为URLEncoding.default是服务器接收到的为标准post请求，类似param&param1&param
         2.为JSONEncoding.default时接收到json串不带&符号
         */
        return request(URLString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            switch response.result.isSuccess {
            case true:
                print( "Received:\(self.replaceUnicode(unicodeStr: response.result.description)) \nFrom Path \(URLString) \n the Result :\(response.result.value)")
                let statusCode = response.response?.statusCode
                print( "requset success: \(statusCode)")
            case false:
                print( "Received HTTP statusCode:\(response.response?.statusCode)")
                print( "request Error: \(response.result.error?.localizedDescription)")
            }
        }
  
    }
    
    /**
     String 值为Unicode格式的字符串编码（如\\u7E8C）转化为中文
     
     - parameter unicodeStr: unicodeStr
     
     - returns: String
     */
    func replaceUnicode(unicodeStr:String?) -> String{
        guard unicodeStr != nil else{return ""}
        
        let tempStr1 = unicodeStr!.replacingOccurrences(of: "\\u", with: "\\U")
        let tempStr2 = tempStr1.replacingOccurrences(of: "\"", with: "\\\"")
        let tempStr3 = "\"".appending(tempStr2).appending("\"")
        let tempData = tempStr3.data(using: String.Encoding.utf8)
        let returnStr = try? PropertyListSerialization.propertyList(from: tempData!, options: [], format: nil)
        if returnStr != nil {
            return (returnStr! as! String).replacingOccurrences(of: "\\r\\n", with: "\n")
        }else {
            return ""
        }
    }
    
    
    /**
     判断网络连接情况
     
     - returns: 网络连接情况
     */
    func isReachable() -> Bool{
        let reachability: Reachability
        do {
           
            reachability =  Reachability.init()!
            var reachable = reachability.isReachable
            if !reachable {
                let status = reachability.currentReachabilityStatus
                if status != .notReachable {
                    reachable = true
                }else{
                    reachable = false
                }
            }
            return reachable
        }
    }
    
}
