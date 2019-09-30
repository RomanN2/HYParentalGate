//
//  HYPGCustomizer.swift
//  HYParentalGate
//
//  Created by Taras Filipovych on 9/27/19.
//  Copyright © 2019 25 Happy Eyes. All rights reserved.
//

import UIKit

class HYPGCustomizer: NSObject {

    private let controller: HYParentalGateViewController
    
    init(with controller: HYParentalGateViewController) {
        self.controller = controller
    }
    
    func customizeContainer(with config: HYParentalGateUIConfig) {
        controller.container.backgroundColor = config.backgroundColor.containerBackgroundColor
        controller.container.layer.cornerRadius = config.cornerRadius.containerCornerRadius
        controller.container.layer.borderWidth = config.borderWidth.containerBorderWidth
        controller.container.layer.borderColor = config.borderColor.containerBorderColor.cgColor
        controller.checkbox.backgroundColor = .clear
        controller.clearButton.backgroundColor = config.backgroundColor.containerBackgroundColor
    }
    
    func customizeNumbers(with config: HYParentalGateUIConfig) {
        controller.numbersView.backgroundColor = config.backgroundColor.numbersBorderBackgroundColor
        controller.numbersView.layer.cornerRadius = config.cornerRadius.numberBackgroundCornerRadius
        
        controller.numbers.forEach {
            $0.titleLabel?.font = config.font.numbersLabelsFont
            $0.setTitleColor(config.fontColor.numbersLabelsColor, for: .normal)
            $0.titleLabel?.textColor = config.fontColor.numbersLabelsColor
            $0.layer.cornerRadius = config.cornerRadius.numbersCornerRadius
            $0.backgroundColor = config.backgroundColor.numbersBackgroundColor
            $0.layer.borderWidth = config.borderWidth.numbersBorderWidth
            $0.layer.borderColor = config.borderColor.numbersBorderColor.cgColor
        }
    }
    
    func customizeDigits(with config: HYParentalGateUIConfig) {
        controller.digitsView.backgroundColor = config.backgroundColor.digitsBorderBackgroundColor
        controller.digitsView.layer.cornerRadius = config.cornerRadius.digitsBackgroundCornerRadius
        controller.digitLabels.forEach {
            $0.font = config.font.numbersLabelsFont
            $0.textColor = config.fontColor.numbersLabelsColor
            $0.backgroundColor = config.backgroundColor.digitsBackgroundColor
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = config.cornerRadius.digitsCornerRadius
        }
    }
    
    func customizeLabels(with config: HYParentalGateUIConfig) {
        controller.forAdultsLabel.font = config.font.adultsOnlyLabelFont
        controller.enterNumbersLabel.font = config.font.enterNumbersLabelFont
        controller.digitsTextLabel.font = config.font.digitsLabelFont
        controller.forAdultsLabel.textColor = config.fontColor.adultsOnlyLabelColor
        controller.enterNumbersLabel.textColor = config.fontColor.enterNumbersLabelColor
        controller.digitsTextLabel.textColor = config.fontColor.digitsLabelColor
    }
    
}

