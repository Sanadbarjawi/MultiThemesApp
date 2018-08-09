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
            return UIColor(red: 255.0/255.0, green: 115.0/255.0, blue: 50.0/255.0, alpha: 1.0)
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
            return UIColor.white
        case .dayTheme:
            return UIColor.black
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
        UserDefaults.standard.set(0, forKey: Keys.selectedTheme)//0 = dayTheme, 1 = nightTheme
        let proxyButton = UIButton.appearance()
        let proxyNavbar = UINavigationBar.appearance()
        let proxyNavbarButton = UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        let proxyTextfield = UITextField.appearance()
        
        proxyButton.setTitleColor(buttonTitleColor, for: .normal)
        proxyButton.backgroundColor = backGroundColor
        proxyNavbar.backgroundColor = navbarColor
        proxyNavbarButton.backgroundColor = UIColor.clear
        proxyNavbar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        proxyTextfield.backgroundColor = textFieldColor
    }
}

