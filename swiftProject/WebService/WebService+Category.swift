//
//  WebService+Category.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation
import HandyJSON

extension WebService {
    
    
    func getAllcity(success:@escaping ([CityModel])-> Void,
                    fail:@escaping (String)-> Void) {
     
        self.httpRequest(URL: URLConstant.test.getcity, requestSuccess: { result  in
            print(result)
//          let animal = JSONDeserializer<CityModel>
            
            }, requestFail: {result in
            
        })
        
        
    }





}
