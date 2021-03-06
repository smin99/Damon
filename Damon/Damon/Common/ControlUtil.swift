//
//  ControlUtil.swift
//  Damon
//
//  Created by HwangSeungmin on 1/27/19.
//  Copyright © 2019 Min. All rights reserved.
//

import SkyFloatingLabelTextField

class ControlUtil {
    // Define properties of text field - for required inputs - light green-blue
    static func setSkyFloatingTextFieldColor(textField: SkyFloatingLabelTextField, placeholder: String, title: String) {
        
        let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
        let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        
        textField.frame.size.height = 45
        
        textField.placeholder = placeholder
        textField.title = title
        
        textField.tintColor = overcastBlueColor // the color of the blinking cursor
        textField.textColor = darkGreyColor
        textField.lineColor = lightGreyColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        
        textField.lineHeight = 1.0 // bottom line height in points
        textField.selectedLineHeight = 2.0
    }
    
    // Define properties of text field - for required inputs - light green-blue
    static func setSkyFloatingTextFieldColor(textField: SkyFloatingLabelTextField) {
        
        let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
        let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        
        textField.frame.size.height = 45
        
        //        textField.tintColor = overcastBlueColor // the color of the blinking cursor
        textField.textColor = darkGreyColor
        textField.lineColor = lightGreyColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        
        textField.lineHeight = 1.0 // bottom line height in points
        textField.selectedLineHeight = 2.0
    }
    
    // Define properties of text field - for other inputs - black color
    static func setSkyFloatingTextField(textField: SkyFloatingLabelTextField, placeholder: String, title: String) {
        
        textField.frame.size.height = 45
        
        textField.placeholder = placeholder
        textField.title = title
        
        textField.lineHeight = 1.0 // bottom line height in points
        textField.selectedLineHeight = 2.0
    }
    
    // 테마 색상 설정 - 네비게이션 바, 상태바, 탭바 의 tintColor, backgroundColor 설정
    static func setThemeColor(tintColor: UIColor = .red, barTintColor: UIColor = .white) {
        // NavigatationBar 초기화
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().tintColor = barTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: barTintColor]
        
        // statusBar 초기화
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = tintColor
        }
        
        // TabBar tintColor 설정
        UITabBar.appearance().tintColor = tintColor
        UITabBar.appearance().barTintColor = barTintColor
    }
}
