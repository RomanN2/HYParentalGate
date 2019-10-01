//
//  HYParentalGate.swift
//  HYParentalGateExample
//
//  Created by Roman Nazarkevych on 10/26/16.
//  Copyright © 2016 25 Happy Eyes. All rights reserved.
//

import UIKit

public class HYParentalGate: NSObject, HYParentalGateViewDelegate, UIGestureRecognizerDelegate {
    
    public static let sharedGate = HYParentalGate()
    var gateViewController: HYParentalGateViewController!
    public var languageCode: String = "en"
    private var UIConfig: HYParentalGateUIConfig?
    
    fileprivate var overlay: UIView?
    fileprivate let overlayTag = 100
    fileprivate var window: UIWindow!
    fileprivate var successHandler: ()->(Void) = {}
    fileprivate var cancelHandler: ()->(Void) = {}
    
    fileprivate let hidingAnimationDuration = 0.15
    
    fileprivate override init() {
        super.init()
        initWindow()
    }
    
    public func setupCustomUI(with config: HYParentalGateUIConfig) {
        self.UIConfig = config
    }
    
    public func setupLanguage(with languageCode: String) {
        self.languageCode = languageCode
    }
    
    public func show(successHandler: @escaping ()->(Void)) {
        initGateViewController()
        self.successHandler = successHandler
        addOverlay()
        overlay?.addSubview(gateViewController.view)
    }
    
    public func show(successHandler: @escaping ()->(Void), cancelHandler: @escaping ()->(Void)) {
        self.cancelHandler = cancelHandler
        show(successHandler: successHandler)
    }
    
    func hide() {
        UIView.animate(withDuration: hidingAnimationDuration,
            animations: {
                self.overlay?.alpha = 0
            },
            completion: { (value: Bool) in
                self.overlay?.removeFromSuperview()
                self.gateViewController = nil
            })
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else { return false }
        return (view.tag == overlayTag)
    }
    
    // MARK: HYParentalGateViewDelegate
    
    func allDigitsAreEnteredCorrectly() {
        hide()
        perform(#selector(HYParentalGate.fireSuccessHandler), with: nil, afterDelay: hidingAnimationDuration)
    }
    
    @objc func fireSuccessHandler() {
        successHandler()
    }
    
    // MARK: Private
    
    fileprivate func initGateViewController() {
        
        let bundle = Bundle(for: self.classForCoder)
        gateViewController = HYParentalGateViewController(nibName: "HYParentalGateViewController", bundle: bundle)
        gateViewController.view.frame = calculateParentalGateFrame()
        gateViewController.setLanguageCode(languageCode)
        gateViewController.delegate = self
        gateViewController.config = UIConfig
        gateViewController.setup()
    }
    
    fileprivate func initWindow() {
        let appDelegate = UIApplication.shared.delegate
        window = appDelegate!.window!
    }

    fileprivate func addOverlay() {
        overlay = UIView(frame: UIScreen.main.bounds)
        overlay?.backgroundColor = UIColor(white: 0.4, alpha: 0.6)
        overlay?.tag = overlayTag
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(HYParentalGate.handleTapOutsideDialog))
        tapRecognizer.delegate = self
        overlay?.addGestureRecognizer(tapRecognizer)
        
        window.addSubview(overlay!)
    }
    
    @objc fileprivate func handleTapOutsideDialog() {
        cancelHandler()
        hide()
    }
    
    fileprivate func calculateParentalGateFrame() -> CGRect {
        let widthCoeff: CGFloat
        let heightCoeff: CGFloat
        if(UIDevice.current.userInterfaceIdiom == .pad){
            widthCoeff = 0.5
            heightCoeff = 0.5
        } else {
            widthCoeff = 0.85
            heightCoeff = 0.85
        }
        
        let gateWidth = widthCoeff * window.frame.size.width
        let gateHeight = heightCoeff * window.frame.size.height
        return CGRect(x: (window.frame.size.width - gateWidth) / 2.0,
                      y: (window.frame.size.height - gateHeight) / 2.0,
                      width: gateWidth,
                      height: gateHeight)
    }
}
