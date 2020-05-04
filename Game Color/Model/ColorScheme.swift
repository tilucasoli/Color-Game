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
    
    let firstValue: Float
    let secondValue: Float
    let thirdValue: Float
    
    init(first: String, second: String, third: String, _ firstValue: Float, _ secondValue: Float, _ thirdValue: Float) {
        self.firstLbl = first
        self.secondLbl = second
        self.thirdLbl = third
        
        self.firstValue = firstValue
        self.secondValue = secondValue
        self.thirdValue = thirdValue
    }
}
