//
//  ViewController.swift
//  Game Color
//
//  Created by Lucas Oliveira on 28/04/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var thirdLbl: UILabel!
    
    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var yourView: UIView!
    
    @IBOutlet weak var firstSldr: UISlider!
    @IBOutlet weak var secondSldr: UISlider!
    @IBOutlet weak var thirdSldr: UISlider!
    
    @IBOutlet weak var firstSideLbl: UILabel!
    @IBOutlet weak var secondSideLbl: UILabel!
    @IBOutlet weak var thirdSideLbl: UILabel!
    
    var colorSlr = ColorSlider()
    
    @IBOutlet weak var rgbOrHsb: UISegmentedControl!
    
    let rgb = ColorScheme(first: "Red", second: "Green", third: "Blue")
    let hsb = ColorScheme(first: "Hue", second: "Saturation", third: "Brightness")
    
    @IBAction func changeScheme(_ sender: Any) {
        let option = rgbOrHsb.selectedSegmentIndex
        
        if option == 0 {
            firstLbl.text = rgb.firstLbl
            secondLbl.text = rgb.secondLbl
            thirdLbl.text = rgb.thirdLbl
            
            firstSldr.maximumValue = rgb.rgbMaxValue
            secondSldr.maximumValue = rgb.rgbMaxValue
            thirdSldr.maximumValue = rgb.rgbMaxValue
            print("Hello")
        }
        else {
            firstLbl.text = hsb.firstLbl
            secondLbl.text = hsb.secondLbl
            thirdLbl.text = hsb.thirdLbl
            
            firstSldr.maximumValue = hsb.hue
            secondSldr.maximumValue = hsb.saturation
            thirdSldr.maximumValue = rgb.brightness
        }
        
    }
    
    // Slider Configuration
    @IBAction func redSldr(_ sender: Any) {
        firstSideLbl.text = String(Int(firstSldr.value))
        colorSlr.red = CGFloat(firstSldr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)
    }
    
    @IBAction func greenSldr(_ sender: Any) {
        secondSideLbl.text = String(Int(secondSldr.value))
        colorSlr.green = CGFloat(secondSldr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)
    }
    
    @IBAction func blueSldr(_ sender: Any) {
        thirdSideLbl.text = String(Int(thirdSldr.value))
        colorSlr.blue = CGFloat(thirdSldr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)

    }
    
    // Generate random color
    @IBAction func btnGenerate(_ sender: Any){
        randomView.backgroundColor = UIColor.random
        
    }
    
    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowDefault(view: randomView)
        shadowDefault(view: yourView)
        
    }

}

class ColorSlider {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
}

func shadowDefault(view: UIView){
    view.layer.cornerRadius = 15
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = .init(width: 0, height: 3)
    view.layer.shadowOpacity = 0.1
    view.layer.shadowRadius = 5
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}

