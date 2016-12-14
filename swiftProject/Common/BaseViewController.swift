//
//  BaseViewController.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/14.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import Foundation

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavbarStyle()
    }
    
    func setNavbarStyle() {
     //导航栏样式
        self.removeBackButtonText()
        self.setNavigationBackButtonColor(color: UIColor.white)

    }
    
    
}
