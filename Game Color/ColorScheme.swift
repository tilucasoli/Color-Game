//
//  ColorScheme.swift
//  Game Color
//
//  Created by Lucas Oliveira on 29/04/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import Foundation
import UIKit

struct ColorScheme {
    // labels
    let firstLbl: String
    let secondLbl: String
    let thirdLbl: String
    
    // max values
    let rgbMaxValue: Float = 255

    let hue: Float = 360
    let saturation: Float = 100
    let brightness: Float = 100
    
    init(first: String, second: String, third: String) {
        self.firstLbl = first
        self.secondLbl = second
        self.thirdLbl = third
    }
}
