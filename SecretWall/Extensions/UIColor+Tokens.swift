//
//  UIColor+Tokens.swift
//  SecretWall
//
//  Created by Thalisson Melo on 27/03/25.
//

import UIKit

extension UIColor {
    struct Background {
        public static var backgroundLight: UIColor {
            return UIColor(named: "Background")!
        }
        
        public static var backgroundDark: UIColor {
            return UIColor(named: "BackgroundDark")!
        }
    }
    
    struct Neutral {
        public static var light: UIColor {
            return UIColor.white
        }
    }
}
