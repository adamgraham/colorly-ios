//
//  UIColor+SignalEncoding.swift
//  Hue
//
//  Created by Adam Graham on 5/24/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import UIKit

/// An extension to describe ITU-R recommendations.
public extension UIColor {

    /// ITU-R Recommendations are the names given to set of international technical
    /// standards developed by the Radiocommunication Sector of the International
    /// Telecommunication Union (ITU).
    enum SignalEncoding {

        /// ITU-R BT.601 (standard-definition television)
        case standard
        /// ITU-R BT.709 (high-definition television)
        case hdtv

    }

}
