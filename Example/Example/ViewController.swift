//
//  ViewController.swift
//  Example
//
//  Created by darkdong on 2016/11/7.
//  Copyright © 2016年 Dong. All rights reserved.
//

import UIKit
import HYParentalGate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.gray
        
        let btn = UIButton()
        btn.setTitle("test", for: .normal)
        btn.sizeToFit()
        btn.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        btn.addTarget(self, action: #selector(test), for: .touchUpInside)
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func test() {
        print("test")
        HYParentalGate.sharedGate.show { () -> (Void) in
            print("parental gate passed")
        }
    }
    
}

