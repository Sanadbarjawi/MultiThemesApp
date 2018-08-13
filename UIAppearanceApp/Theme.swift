//
//  Theme.swift
//  UIAppearanceApp
//
//  Created by Sanad Barjawi on 8/8/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

enum Theme: Int {
    case dayTheme, nightTheme
    
    private enum Keys{
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: Theme{
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .dayTheme
    }
    
    var navbarColor: UIColor{
        switch self {
        case .nightTheme:
            return UIColor.darkGray
        case .dayTheme:
            return UIColor.blue
        }
    }
    
    var textFieldColor: UIColor{
        switch self {
        case .nightTheme:
            return UIColor.darkGray
        case .dayTheme:
            return UIColor.gray
        }
    }
    
    var buttonTitleColor: UIColor{
        switch self {
        case .nightTheme:
            return UIColor.black
        case .dayTheme:
            return UIColor.white
        }
    }
    
    var buttonBackgroundColor: UIColor{
        switch self {
        case .nightTheme:
            return UIColor.white
        case .dayTheme:
            return UIColor.black
        }
    }
    
    var buttonCornerRadius: CGFloat{
        switch self {
        case .nightTheme:
            return 0.0
        case .dayTheme:
            return 12.0
        }
    }
    
    var backGroundColor: UIColor{
        switch self {
        case .nightTheme:
            return UIColor.black
        case .dayTheme:
            return UIColor.darkGray
        }
    }
    
    func apply(){
        UserDefaults.standard.set(1, forKey: Keys.selectedTheme)//0 = dayTheme, 1 = nightTheme
        let proxyNavbar = UINavigationBar.appearance()
        proxyNavbar.backgroundColor = navbarColor
        proxyNavbar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
    }
}
//MARK: - Designable Classes(Button,View)
///CustomView designable Class
@IBDesignable
class CustomView: UIView {
    @IBInspectable var viewColor:UIColor? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = viewColor ?? Theme.current.backGroundColor
    }
}

///CustomView designable Class
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var buttonColor:UIColor? = nil
    @IBInspectable var buttonTitleColor:UIColor? = nil
    @IBInspectable var cornerRadius: CGFloat {
        get {
            if layer.cornerRadius == 0.0 {
                return Theme.current.buttonCornerRadius
            }else{
                return layer.cornerRadius
            }
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = buttonColor ?? Theme.current.buttonBackgroundColor
        self.setTitleColor(buttonTitleColor ?? Theme.current.buttonTitleColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
        
    }
}

