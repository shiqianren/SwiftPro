//
//  CityModel.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation
import HandyJSON
class CityModel: HandyJSON  {
    
    var id : Int?
    var name : String?
    var parentId : Int?
    var shortName: String?
    var levelType: Int?
    var cityCode: String?
    var zipCode: String?
    var mergerName: String?
    
    
    required init() {

    }
    
    
    
}
