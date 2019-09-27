//
//  HYParentalGateViewController.swift
//  HYParentalGateExample
//
//  Created by Roman Nazarkevych on 10/26/16.
//  Copyright © 2016 25 Happy Eyes. All rights reserved.
//

import UIKit

protocol HYParentalGateViewDelegate: class {
    func allDigitsAreEnteredCorrectly()
}

class HYParentalGateViewController: UIViewController {

    @IBOutlet weak var digitsTextLabel: UILabel!
    @IBOutlet weak var digitsView: UIView!
    @IBOutlet weak var checkbox: HYCheckBox!
    @IBOutlet var digitLabels: [UILabel]!
    @IBOutlet weak var enterNumbersLabel: UILabel!
    @IBOutlet weak var forAdultsLabel: UILabel!
    @IBOutlet var container: UIView!
    @IBOutlet var numbers: [UIButton]!
    @IBOutlet weak var numbersView: UIView!
    
    weak var delegate: HYParentalGateViewDelegate?
    var config: HYParentalGateUIConfig?
    
    fileprivate let digitsAmount = 3
    fileprivate var digits = [Int]()
    fileprivate let localizationHelper = HYLocalizationHelper()
    
    private lazy var UIcustomizer: HYPGCustomizer = { [unowned self] in
        let customizer = HYPGCustomizer(with: self)
        return customizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRoundedCorners()
    }

    @IBAction func onDigitAction(_ sender: AnyObject) {
        currentDigitLabel().text = String(sender.tag)
        checkIfAllDigitsAreEntered()
    }
    
    @IBAction func onEraseAction(_ sender: AnyObject) {
        let label = lastDigitLabel()
        label?.text = ""
    }
    
    func setup() {
        customizeUI()
        setupDigits()
        setupDigitsTextLabel()
        forAdultsLabel.text = localizationHelper.stringForKey("adults_only")
        enterNumbersLabel.text = localizationHelper.stringForKey("enter_numbers")
    }
    
    @objc func clearAllDigitLabels() {
        for label in digitLabels {
            label.text = ""
        }
    }
    
    func setLanguageCode(_ code: String) {
        localizationHelper.languageCode = code
    }
    
    // MARK: Private
    
    fileprivate func customizeUI() {
        if let config = self.config {
            UIcustomizer.customizeLabels(with: config)
            UIcustomizer.customizeDigits(with: config)
            UIcustomizer.customizeNumbers(with: config)
            UIcustomizer.customizeContainer(with: config)
        }
    }
    
    fileprivate func checkIfAllDigitsAreEntered() {
        guard allDigitsEntered() else { return }
        guard delegate != nil else { return }
        
        var result = true
        for i in 0...digitsAmount-1 {
            if digits[i] != Int(digitLabels[i].text!)! {
                result = false
                break
            }
        }
        
        if result {
            handleCorrectPin()
        } else {
            perform(#selector(HYParentalGateViewController.handleWrongPin), with: nil, afterDelay: 0.3)
        }
    }
    
    fileprivate func handleCorrectPin() {
        hideDigitsDeck()
        checkbox.isHidden = false
        checkbox.perform(#selector(HYCheckBox.drawCheck), with: nil, afterDelay: 0.3)
        perform(#selector(HYParentalGateViewController.notifyDelegateThatPinEntered), with: nil, afterDelay: 1.2)
    }
    
    @objc func notifyDelegateThatPinEntered() {
        delegate!.allDigitsAreEnteredCorrectly()
    }
    
    @objc func handleWrongPin() {
        shake(digitsView)
        perform(#selector(HYParentalGateViewController.clearAllDigitLabels), with: nil, afterDelay: 0.2)
    }
    
    fileprivate func setupDigits() {
        digits.removeAll()
        for _ in 1...digitsAmount {
            digits.append(Int(arc4random_uniform(10)))
        }
    }
    
    fileprivate func setupDigitsTextLabel() {
        var digitsString = ""
        for i in 0...digitsAmount-1 {
            digitsString += localizationHelper.stringForKey(String(digits[i]))
            if i != digitsAmount-1 {
                digitsString += ", "
            }
        }
        digitsTextLabel.text = digitsString
    }
    
    fileprivate func setupRoundedCorners() {
        self.view.layer.cornerRadius = 10.0
        self.view.layer.borderColor = UIColor.blue.cgColor
        self.view.layer.masksToBounds = true
    }
    
    fileprivate func currentDigitLabel() -> UILabel! {
        for label in digitLabels {
            if label.text?.count == 0 {
                return label
            }
        }
        return digitLabels.last
    }
    
    fileprivate func lastDigitLabel() -> UILabel! {
        for label in digitLabels.reversed() {
            if (label.text?.count)! > 0 {
                return label
            }
        }
        return digitLabels.first
    }
    
    fileprivate func allDigitsEntered() -> Bool {
        guard let lastLabel = digitLabels.last else { return false }
        guard let text = lastLabel.text else { return false }
        return text.count > 0
    }
    
    fileprivate func shake(_ view: UIView) {
        let anim = CAKeyframeAnimation(keyPath:"transform")
        anim.values = [
            NSValue(caTransform3D:CATransform3DMakeTranslation(-7, 0, 0)),
            NSValue(caTransform3D:CATransform3DMakeTranslation(7, 0, 0))
        ]
        anim.autoreverses = true
        anim.repeatCount = 2
        anim.duration = 0.1
        
        view.layer.add(anim, forKey:nil)
    }
    
    fileprivate func hideDigitsDeck() {
        UIView.animate(withDuration: 0.15, animations: {
            self.digitsView.alpha = 0
        })
    }
}
