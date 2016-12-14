//
//  UIViewController.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation

extension UIViewController {

    /**
     去除navigationBar上返回键的文字
     */
    func removeBackButtonText() ->Void {
        guard self.navigationController != nil else {return}
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
    func setNavigationBackButtonColor(color:UIColor){
        guard self.navigationController != nil else {return}
        
        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.tintColor = color
    }
    
    /**
     获取storyboard中的viewController
     
     - parameter storyboardName: storyboardName
     - parameter vcIdentifier:   控制器id
     
     - returns: 制定的viewcontroller
     */
    func viewControllerInStoryboard(storyboardName:String,vcIdentifier:String) -> UIViewController{
        let storyboard = UIStoryboard(name: storyboardName,bundle:nil)
        return  storyboard.instantiateViewController(withIdentifier: vcIdentifier)
    }


}
