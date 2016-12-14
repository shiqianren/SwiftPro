//
//  ViewController.swift
//  swiftProject
//
//  Created by shiqianren on 16/12/13.
//  Copyright © 2016年 shiqianren. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "生活"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func GetAllCity(_ sender: UIButton) {
//        WebService.webServiceRequest.alamostFireRequest(URLString: URLConstant.test.getcity.suffix, parameters: nil)
        WebService.webServiceRequest.getAllcity(success: { (data) in
            
            }, fail: { faileMessage in
                
                
             
        
        })
        
        
        
    }
}

