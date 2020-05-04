//
//  ViewController.swift
//  Game Color
//
//  Created by Lucas Oliveira on 28/04/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    
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
    
    @IBOutlet weak var rgbOrHsb: UISegmentedControl!
    
    // Criando as classes que armazenaram os dados das cores RGB e HSB
    var dataRgbColors = DataColors(0, 0)
    var dataHsbColors = DataColors(1, 1)
    
    let rgb = ColorScheme(first: "Red", second: "Green", third: "Blue", 255, 255, 255)
    let hsb = ColorScheme(first: "Hue", second: "Saturation", third: "Brightness", 360, 100, 100)
    
    @IBAction func changeScheme(_ sender: Any) {
        let option = rgbOrHsb.selectedSegmentIndex
        
        if option == 0 {
            refresh(colorScheme: rgb, dataColors: dataRgbColors, 255, 255, 255)
        } else {
            refresh(colorScheme: hsb, dataColors: dataHsbColors, 360, 100, 100)
        }
        
    }
    
    // Slider Configuration
    @IBAction func redSldr(_ sender: Any) {
        let option = rgbOrHsb.selectedSegmentIndex
        firstSideLbl.text = String(Int(firstSldr.value))
        
        if option == 0 {
            dataRgbColors.first = CGFloat(firstSldr.value/255)
            yourView.backgroundColor = UIColor(displayP3Red: dataRgbColors.first, green: dataRgbColors.second, blue: dataRgbColors.third, alpha: 1)
        } else {
            dataHsbColors.first = CGFloat(firstSldr.value/360)
            yourView.backgroundColor = UIColor(hue: dataHsbColors.first, saturation: dataHsbColors.second, brightness: dataHsbColors.third, alpha: 1)
        }

    }
    
    @IBAction func greenSldr(_ sender: Any) {
        let option = rgbOrHsb.selectedSegmentIndex
        secondSideLbl.text = String(Int(secondSldr.value))
        
        if option == 0 {
            dataRgbColors.second = CGFloat(secondSldr.value/255)
            yourView.backgroundColor = UIColor(displayP3Red: dataRgbColors.first, green: dataRgbColors.second, blue: dataRgbColors.third, alpha: 1)
        } else {
            dataHsbColors.second = CGFloat(secondSldr.value/100)
            yourView.backgroundColor = UIColor(hue: dataHsbColors.first, saturation: dataHsbColors.second, brightness: dataHsbColors.third, alpha: 1)
        }
        
    }
    
    @IBAction func blueSldr(_ sender: Any) {
        let option = rgbOrHsb.selectedSegmentIndex
        thirdSideLbl.text = String(Int(thirdSldr.value))
        
        if option == 0 {
            dataRgbColors.third = CGFloat(thirdSldr.value/255)
            yourView.backgroundColor = UIColor(displayP3Red: dataRgbColors.first, green: dataRgbColors.second, blue: dataRgbColors.third, alpha: 1)
        } else {
            dataHsbColors.third = CGFloat(thirdSldr.value/100)
            yourView.backgroundColor = UIColor(hue: dataHsbColors.first, saturation: dataHsbColors.second, brightness: dataHsbColors.third, alpha: 1)
        }

    }
    
    // start the game
    @IBAction func btnGenerate(_ sender: Any){
        randomView.backgroundColor = UIColor.random
        
    }
    
    // did load
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowDefault(view: randomView)
        shadowDefault(view: yourView)
        
    }

    func refresh(colorScheme: ColorScheme, dataColors: DataColors,_ firstMultiply: Float,_ secondMultiply: Float, _ thirdMultiply: Float){
        
        firstLbl.text = colorScheme.firstLbl
        secondLbl.text = colorScheme.secondLbl
        thirdLbl.text = colorScheme.thirdLbl
        
        firstSideLbl.text = String(Int(Float(dataColors.first) * firstMultiply))
        secondSideLbl.text = String(Int(Float(dataColors.second) * secondMultiply))
        thirdSideLbl.text = String(Int(Float(dataColors.third) * thirdMultiply))

        firstSldr.maximumValue = colorScheme.firstValue
        secondSldr.maximumValue = colorScheme.secondValue
        thirdSldr.maximumValue = colorScheme.thirdValue
        
        firstSldr.value = Float(dataColors.first) * firstMultiply
        secondSldr.value = Float(dataColors.second) * secondMultiply
        thirdSldr.value = Float(dataColors.third) * thirdMultiply
        
        if colorScheme.firstValue == 255 {
            yourView.backgroundColor = UIColor(displayP3Red: dataColors.first, green: dataColors.second, blue: dataColors.third, alpha: 1)
        } else {
            yourView.backgroundColor = UIColor(hue: dataColors.first, saturation: dataColors.second, brightness: dataColors.third, alpha: 1)
        }
        
    }
    
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

