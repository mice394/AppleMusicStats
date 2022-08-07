//
//  Extensions.swift
//  MusicKit
//
//  Created by Emily Shao on 2021-10-08.
//

import Foundation
import UIKit

extension UIColor {

    //MARK: - Background Colours
    class func screenBG() -> UIColor {
        return UIColor(red: 9/255, green: 23/255, blue: 21/255, alpha: 1.0)
    }

    class func cardViewBG() -> UIColor {
        return UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1.0)
    }

    class func segmentControlColor() -> UIColor {
        return UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
    }

    class func tabbarUnselectedColor() -> UIColor {
        return UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)
    }

    class func tabbarSelectedColor() -> UIColor {
        return UIColor(red: 253/255, green: 79/255, blue: 225/255, alpha: 1.0)
    }

    //MARK: - Text Colours
    class func neonPink() -> UIColor {
        return UIColor(red: 253/255, green: 79/255, blue: 225/255, alpha: 1.0)
    }

    class func turquoise() -> UIColor {
        return UIColor(red: 39/255, green: 233/255, blue: 205/255, alpha: 1.0)
    }
}

extension UIView {

    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

