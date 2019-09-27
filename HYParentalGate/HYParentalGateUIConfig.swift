//
//  HYParentalGateUIConfig.swift
//  HYParentalGate
//
//  Created by Taras Filipovych on 9/27/19.
//  Copyright © 2019 25 Happy Eyes. All rights reserved.
//

import UIKit

public struct HYParentalGateUIConfig {
    let font: HYPGFont
    let fontColor: HYPGFontColor
    let cornerRadius: HYPGCornerRadius
    let backgroundColor: HYPGBackgroundColor
    let borderColor: HYPGBorderColor
    let borderWidth: HYPGBorderWidth
    
    public init (fonts: HYPGFont, fontColors: HYPGFontColor, cornerRadiuses: HYPGCornerRadius,
                 backgroundColors: HYPGBackgroundColor, borderColor: HYPGBorderColor, borderWidth: HYPGBorderWidth) {
        self.font = fonts
        self.fontColor = fontColors
        self.cornerRadius = cornerRadiuses
        self.backgroundColor = backgroundColors
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}

public struct HYPGFont {
    let adultsOnlyLabelFont: UIFont
    let enterNumbersLabelFont: UIFont
    let digitsLabelFont: UIFont
    let numbersLabelsFont: UIFont
    
    public init(adultsOnlyLabelFont: UIFont, enterNumbersLabelFont: UIFont, digitsLabelFont: UIFont, numbersLabelsFont: UIFont) {
        self.adultsOnlyLabelFont = adultsOnlyLabelFont
        self.enterNumbersLabelFont = enterNumbersLabelFont
        self.digitsLabelFont = digitsLabelFont
        self.numbersLabelsFont = numbersLabelsFont
    }
}

public struct HYPGFontColor {
    let adultsOnlyLabelColor: UIColor
    let enterNumbersLabelColor: UIColor
    let digitsLabelColor: UIColor
    let numbersLabelsColor: UIColor
    
    public init (adultsOnlyLabelColor: UIColor, enterNumbersLabelColor: UIColor, digitsLabelColor: UIColor, numbersLabelsColor: UIColor) {
        self.adultsOnlyLabelColor = adultsOnlyLabelColor
        self.enterNumbersLabelColor = enterNumbersLabelColor
        self.digitsLabelColor = digitsLabelColor
        self.numbersLabelsColor = numbersLabelsColor
    }
}

public struct HYPGCornerRadius {
    let containerCornerRadius: CGFloat
    let numbersCornerRadius: CGFloat
    let numberBackgroundCornerRadius: CGFloat
    let digitsCornerRadius: CGFloat
    let digitsBackgroundCornerRadius: CGFloat
    
    public init(containerCornerRadius: CGFloat, numbersCornerRadius: CGFloat, numberBackgroundCornerRadius: CGFloat, digitsCornerRadius: CGFloat, digitsBackgroundCornerRadius: CGFloat) {
        self.containerCornerRadius = containerCornerRadius
        self.numbersCornerRadius = numbersCornerRadius
        self.numberBackgroundCornerRadius = numberBackgroundCornerRadius
        self.digitsCornerRadius = digitsCornerRadius
        self.digitsBackgroundCornerRadius = digitsBackgroundCornerRadius
    }
}

public struct HYPGBackgroundColor {
    let containerBackgroundColor: UIColor
    let numbersBackgroundColor: UIColor
    let numbersBorderBackgroundColor: UIColor
    let digitsBackgroundColor: UIColor
    let digitsBorderBackgroundColor: UIColor
    
    public init(containerBackgroundColor: UIColor, numbersBackgroundColor: UIColor, numbersBorderBackgroundColor: UIColor, digitsBackgroundColor: UIColor, digitsBorderBackgroundColor: UIColor) {
        self.containerBackgroundColor = containerBackgroundColor
        self.numbersBackgroundColor = numbersBackgroundColor
        self.numbersBorderBackgroundColor = numbersBorderBackgroundColor
        self.digitsBackgroundColor = digitsBackgroundColor
        self.digitsBorderBackgroundColor = digitsBorderBackgroundColor
    }
}

public struct HYPGBorderColor {
    let containerBorderColor: UIColor
    let numbersBorderColor: UIColor
    
    public init(containerBorderColor: UIColor, numbersBorderColor: UIColor) {
        self.containerBorderColor = containerBorderColor
        self.numbersBorderColor = numbersBorderColor
    }
}

public struct HYPGBorderWidth {
    let containerBorderWidth: CGFloat
    let numbersBorderWidth: CGFloat
    
    public init(containerBorderWidth: CGFloat, numbersBorderWidth: CGFloat) {
        self.containerBorderWidth = containerBorderWidth
        self.numbersBorderWidth = numbersBorderWidth
    }
}
