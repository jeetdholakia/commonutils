//
//  ShapeUtils.swift
//  100M_India_Community-iOS
//
//  Created by Jeet Dholakia on 7/4/19.
//  Copyright © 2019 Dhruv. All rights reserved.
//

import Foundation

open class ShapeUtils: NSObject {
    
    private static let darkBlueColor = UIColor(red: 24.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    private static let purpleColor = UIColor(red: 24.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    
    static func shadowWithCustomCornerRadius(view:UIView, radius :CGFloat) {
        view.layoutIfNeeded()
        view.layer.cornerRadius = radius
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 10
        
    }
    
    static func shadowWithCornerRadius(view:UIView) {
        view.layoutIfNeeded()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 10
        
    }
    
    static func shadowWithCornerRadius(view:UIView,corners: UIRectCorner) {
        view.layoutIfNeeded()
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 10
        
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: view.layer.cornerRadius, height: view.layer.cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    static func roundToPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }
    
    static func setEyeTypeCurveImageView(imgview:UIImageView) {
        imgview.layer.cornerRadius = 20
        imgview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        imgview.layer.borderColor = darkBlueColor.cgColor
        imgview.layer.borderWidth = 1.5
    }
    static func setEyeTypeCurveButton(btn:UIButton) {
        btn.layer.cornerRadius = 20
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        btn.layer.borderColor = darkBlueColor.cgColor
        btn.layer.borderWidth = 1.5
    }
    
    static func setBottomLeftSharpWithPurpleColor(btn:UIButton) {
        btn.layer.cornerRadius = btn.frame.size.height / 2
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner,.layerMaxXMinYCorner]
        btn.layer.borderWidth = 2.0
        btn.layer.borderColor = purpleColor.cgColor
    }
    
    static func setBottomLeftSharpButton(btn:UIButton) {
        btn.layer.cornerRadius = btn.frame.size.height / 2
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    static func setBottomLeftSharpWithBlueColor(view:UIView) {
        view.layer.cornerRadius = view.frame.size.height / 2
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.borderWidth = 2.0
        view.layer.borderColor = darkBlueColor.cgColor
    }
    
    static func addCornerToBottomLeft(view: UIView, color:UIColor, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.borderWidth = 2.0
        view.layer.borderColor = color.cgColor
    }
    
    static func setLabelAndBottomLineColorOfUITextField(view: UIView, color: UIColor) {
        //label.textColor = color
        view.backgroundColor = color
    }
}
