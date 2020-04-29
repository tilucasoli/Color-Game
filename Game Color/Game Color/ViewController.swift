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
    
    @IBAction func changeScheme(_ sender: Any) {
        firstLbl.text = "Hue"
        secondLbl.text = "Saturation"
        thirdLbl.text = "Brightness"
    }
    
    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var yourView: UIView!
    
    @IBOutlet weak var redSlr: UISlider!
    @IBOutlet weak var greenSlr: UISlider!
    @IBOutlet weak var blueSlr: UISlider!
    
    @IBOutlet weak var redLbl: UILabel!
    @IBOutlet weak var greenLbl: UILabel!
    @IBOutlet weak var blueLbl: UILabel!
    
    var colorSlr = ColorSlider()
    
    @IBAction func redSldr(_ sender: Any) {
        redLbl.text = String(Int(redSlr.value))
        colorSlr.red = CGFloat(redSlr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)
    }
    
    @IBAction func greenSldr(_ sender: Any) {
        greenLbl.text = String(Int(greenSlr.value))
        colorSlr.green = CGFloat(greenSlr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)
    }
    
    @IBAction func blueSldr(_ sender: Any) {
        blueLbl.text = String(Int(blueSlr.value))
        colorSlr.blue = CGFloat(blueSlr.value/255)
        
        yourView.backgroundColor = UIColor(displayP3Red: colorSlr.red, green: colorSlr.green, blue: colorSlr.blue, alpha: 1)

    }
    
    @IBAction func btnGenerate(_ sender: Any){
        randomView.backgroundColor = UIColor.random
        
    }
    
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

