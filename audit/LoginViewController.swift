//
//  LoginViewController.swift
//  audit
//
//  Created by 武恩泽 on 15/11/19.
//  Copyright © 2015年 武恩泽. All rights reserved.
//

import UIKit
import MBProgressHUD
import LocalAuthentication

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "验证"
        
        let authButton: UIButton = UIButton(type: .System) //as UIButton
        authButton.frame = CGRect(x: 100, y: self.view.frame.size.height / 2, width: 100, height: 30)
        authButton.setTitle("验证", forState: UIControlState.Normal)
        
        authButton.addTarget(self, action: Selector("addPassAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(authButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPassAction(sender:UIButton!) {
        print(" add pass action")
        
        let laContext = LAContext()
        var authError : NSError?
        let errorReason = "keep things secret"
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError) {
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: errorReason, reply: { (success, ErrorType) in if success {
                    print("succeed")
                } else {
                    print("faild")
                }
            })
        } else {
            var alert = UIAlertView(title: "Can not do authenticatation", message: "", delegate: nil, cancelButtonTitle: "cancel")
            alert.show()
        }
        
        
    }
    

}
