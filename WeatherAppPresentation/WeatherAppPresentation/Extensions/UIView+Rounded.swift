//
//  UIView+Rounded.swift
//  WeatherAppPresentation
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import UIKit

extension UIView
{
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

