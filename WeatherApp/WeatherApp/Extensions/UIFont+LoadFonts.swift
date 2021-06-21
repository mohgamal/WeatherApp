//
//  UIFont+LoadFonts.swift
//  WeatherApp
//
//  Created by Mohammed Abd El-Aty on 21/06/2021.
//

import WeatherAppPresentation
import UIKit

extension UIFont {
    private static func registerFont(withName name: String, fileExtension: String) {
        let frameworkBundle = Bundle(for: CityWeatherView.self)
        let pathForResourceString = frameworkBundle.path(forResource: name, ofType: fileExtension)
        let fontData = NSData(contentsOfFile: pathForResourceString!)
        let dataProvider = CGDataProvider(data: fontData!)
        let fontRef = CGFont(dataProvider!)
        var errorRef: Unmanaged<CFError>? = nil

        if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
            print("Error registering font")
        }
    }

    public static func loadFonts() {
        registerFont(withName: "Montserrat-Bold", fileExtension: "ttf")
        registerFont(withName: "Montserrat-Light", fileExtension: "ttf")
        registerFont(withName: "Montserrat-Regular", fileExtension: "ttf")
    }
}
