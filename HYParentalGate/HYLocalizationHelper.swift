//
//  HYLocalizationHelper.swift
//  HYParentalGateExample
//
//  Created by Roman Nazarkevych on 10/29/16.
//  Copyright © 2016 25 Happy Eyes. All rights reserved.
//

import UIKit

class HYLocalizationHelper: NSObject {
    
    fileprivate var plistDict = [String: AnyObject]()
    var languageCode = "en"
    
    override init() {
        super.init()
        readFromPlist()
    }
    
    func stringForKey(_ key: String) -> String {
        guard let stringsDict = plistDict[languageCode] else { return "" }
        guard let value = stringsDict[key] else { return "" }
        return value as! String
    }
    
    fileprivate func readFromPlist() {
        guard let bundle = Bundle(identifier: "com.25happyeyes.parentalgate") else { return }
        guard let path = bundle.path(forResource: "HYLocalization", ofType: "plist") else { return }
        guard let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] else { return }
        plistDict = dict
    }
}
