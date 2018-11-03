//
//  ViewController.swift
//  Example
//
//  Created by Roman Nazarkevych on 11/3/18.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit
import HYParentalGate

class ViewController: UIViewController {

    @IBAction func showParentalGate() {
        HYParentalGate.sharedGate.show(successHandler: {
            print("parental gate passed")
        }, cancelHandler: {
            print("parental gate dismissed")
        })
    }

}

